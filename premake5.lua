workspace "SMMWE-TextureLoader"
    configurations { "Debug", "Release" }
    platforms { "x86" }
    startproject "TextureLoader"

    flags { "MultiProcessorCompile" }

    filter "platforms:x86"
        architecture "x86"

binaries = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "TextureLoader"
include "libSMMWE"

newaction {
    trigger = "clean",
    description = "Remove all binaries and intermediate binaries, and vs files.",
    execute = function()
        print("Removing binaries")
        os.rmdir("./bin")
        print("Removing intermediate binaries")
        os.rmdir("./bin-int")
        print("Removing project files")
        os.rmdir("./.vs")
        os.remove("**.sln")
        os.remove("**.vcxproj")
        os.remove("**.vcxproj.filters")
        os.remove("**.vcxproj.user")
        print("Done")
    end
}