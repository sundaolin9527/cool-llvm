#include <llvm/Config/llvm-config.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Metadata.h>
#include <llvm/IR/Module.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

namespace {

class CoolModuleSummaryPass : public llvm::PassInfoMixin<CoolModuleSummaryPass> {
public:
    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager&) {
        unsigned int definedFunctionCount = 0;
        for (llvm::Function& function : module) {
            if (!function.isDeclaration()) {
                ++definedFunctionCount;
            }
        }

        if (llvm::NamedMDNode* existing = module.getNamedMetadata("cool.module.summary")) {
            module.eraseNamedMetadata(existing);
        }

        llvm::LLVMContext& context = module.getContext();
        llvm::NamedMDNode* summary = module.getOrInsertNamedMetadata("cool.module.summary");
        llvm::Metadata* summaryItems[] = {
            llvm::MDString::get(context, "cool-module-summary"),
            llvm::ConstantAsMetadata::get(
                llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), definedFunctionCount))
        };
        summary->addOperand(llvm::MDNode::get(context, summaryItems));
        return llvm::PreservedAnalyses::none();
    }
};

}  // namespace

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION,
        "CoolModuleSummaryPass",
        LLVM_VERSION_STRING,
        [](llvm::PassBuilder& passBuilder) {
            passBuilder.registerPipelineParsingCallback(
                [](llvm::StringRef name,
                   llvm::ModulePassManager& modulePassManager,
                   llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
                    if (name != "cool-module-summary") {
                        return false;
                    }

                    modulePassManager.addPass(CoolModuleSummaryPass());
                    return true;
                });
        }
    };
}
