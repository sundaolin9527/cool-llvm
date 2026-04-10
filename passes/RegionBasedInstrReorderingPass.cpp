#include <llvm/Config/llvm-config.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

#include <algorithm>
#include <unordered_map>
#include <vector>

namespace {

// 方案：
// 1. LLVM New PM 没有直接暴露独立 RegionPass，这里用函数级包装来做 SESE 区域内的调度；
// 2. 在每个基本块里先构建 use-def DAG，再做一个稳定的拓扑排序；
// 3. 只移动纯计算指令，避免内存依赖和边界 PHI 带来的复杂性。
class RegionBasedInstrReorderingPass
    : public llvm::PassInfoMixin<RegionBasedInstrReorderingPass> {
public:
    llvm::PreservedAnalyses run(llvm::Function& function, llvm::FunctionAnalysisManager&) {
        bool changed = false;
        for (llvm::BasicBlock& block : function) {
            changed = reorderBlock(block) || changed;
        }
        return changed ? llvm::PreservedAnalyses::none() : llvm::PreservedAnalyses::all();
    }

private:
    static bool isReorderable(const llvm::Instruction& instruction) {
        return !instruction.isTerminator() &&
               !llvm::isa<llvm::PHINode>(instruction) &&
               !instruction.mayReadOrWriteMemory() &&
               !instruction.isEHPad();
    }

    static std::string stableKey(const llvm::Instruction& instruction) {
        return std::string(instruction.getOpcodeName()) + ":" + instruction.getName().str();
    }

    static bool reorderBlock(llvm::BasicBlock& block) {
        std::vector<llvm::Instruction*> candidates;
        std::unordered_map<const llvm::Instruction*, std::size_t> indexMap;
        for (llvm::Instruction& instruction : block) {
            if (!isReorderable(instruction)) {
                continue;
            }
            indexMap[&instruction] = candidates.size();
            candidates.push_back(&instruction);
        }

        if (candidates.size() < 2) {
            return false;
        }

        std::vector<unsigned int> indegree(candidates.size(), 0);
        std::vector<std::vector<std::size_t>> edges(candidates.size());
        for (std::size_t index = 0; index < candidates.size(); ++index) {
            llvm::Instruction* instruction = candidates[index];
            for (llvm::Value* operand : instruction->operands()) {
                auto* dependency = llvm::dyn_cast<llvm::Instruction>(operand);
                if (dependency == nullptr) {
                    continue;
                }

                auto found = indexMap.find(dependency);
                if (found == indexMap.end()) {
                    continue;
                }

                edges[found->second].push_back(index);
                ++indegree[index];
            }
        }

        std::vector<std::size_t> ready;
        for (std::size_t index = 0; index < candidates.size(); ++index) {
            if (indegree[index] == 0) {
                ready.push_back(index);
            }
        }

        std::vector<llvm::Instruction*> ordered;
        ordered.reserve(candidates.size());
        while (!ready.empty()) {
            std::sort(ready.begin(), ready.end(), [&](std::size_t lhs, std::size_t rhs) {
                return stableKey(*candidates[lhs]) < stableKey(*candidates[rhs]);
            });

            const std::size_t next = ready.front();
            ready.erase(ready.begin());
            ordered.push_back(candidates[next]);

            for (std::size_t dependent : edges[next]) {
                --indegree[dependent];
                if (indegree[dependent] == 0) {
                    ready.push_back(dependent);
                }
            }
        }

        if (ordered.size() != candidates.size()) {
            return false;
        }
        if (std::equal(candidates.begin(), candidates.end(), ordered.begin())) {
            return false;
        }

        llvm::Instruction* insertBefore = block.getTerminator();
        for (llvm::Instruction* instruction : ordered) {
            instruction->moveBefore(insertBefore);
        }
        return true;
    }
};

}  // namespace

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION,
        "RegionBasedInstrReorderingPass",
        LLVM_VERSION_STRING,
        [](llvm::PassBuilder& passBuilder) {
            passBuilder.registerPipelineParsingCallback(
                [](llvm::StringRef name,
                   llvm::FunctionPassManager& functionPassManager,
                   llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
                    if (name != "region-based-instr-reordering") {
                        return false;
                    }

                    functionPassManager.addPass(RegionBasedInstrReorderingPass());
                    return true;
                });
        }
    };
}
