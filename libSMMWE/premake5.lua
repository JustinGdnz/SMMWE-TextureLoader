project "libSMMWE"
    kind "SharedLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. binaries .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. binaries .. "/%{prj.name}")

    pchheader "pch.h"
	    pchsource "src/pch.cpp"

    files {
        "src/**.cpp",
        "src/**.h"
    }

    includedirs {
        "src"
    }

    postbuildcommands
    {
        "{COPY} \"%{cfg.targetdir}/libSMMWE.dll\" \"%{wks.location}/TLApp/src/extensions/TextureLoader\""
    }

    filter { "system:windows" }
        systemversion "latest"

    filter { "configurations:Debug" }
        runtime "Debug"
        symbols "on"

    filter { "configurations:Release" }
        runtime "Release"
        optimize "on"