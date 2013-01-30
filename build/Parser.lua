project "Parser"
  
  kind     "SharedLib"
  language "C++"
        location "."
        platforms { "x32" }

  flags { common_flags, "Managed" }

  configuration "vs*"
    buildoptions { common_msvc_copts, "/clr" }

  configuration "*"
  
  files
  {
    "../src/Parser/**.h",
    "../src/Parser/**.cpp",
    "./*.lua"
  }
  
  includedirs
  {
    "../../LLVM/include",
    "../../LLVM/build/include",
    "../../LLVM/tools/clang/include",
    "../../LLVM/build/tools/clang/include"
  }
  
  configuration "Debug"
    libdirs { "../../LLVM/build/lib/Debug" }

  configuration "Release"
    libdirs { "../../LLVM/build/lib/RelWithDebInfo" }    
  
  configuration "*"
  
  links
  {
    "LLVMSupport",
    "LLVMAsmParser",
    "LLVMMC",
    "LLVMMCParser",
    "LLVMX86AsmParser",
    "LLVMX86AsmPrinter",
    "LLVMX86Desc",
    "LLVMX86Info",
    "LLVMX86Utils",
    "clangAnalysis",
    "clangBasic",
    "clangAST",
    "clangDriver",
    "clangEdit",
    "clangFrontend",
    "clangLex",
    "clangParse",
    "clangSema",
    "clangSerialization"
  }