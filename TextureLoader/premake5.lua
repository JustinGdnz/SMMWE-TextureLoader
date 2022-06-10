project "TextureLoader"
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
        "src/**.h",

        "vendor/libzip/lib/**.c",
        "vendor/libzip/lib/**.h",

        "vendor/zlib/*.c",
        "vendor/zlib/*.h"
    }

    includedirs {
        "src",
        "vendor/libzippp/src",
        "vendor/libzip/lib"
    }

    postbuildcommands
    {
        "{COPY} \"%{cfg.targetdir}/TextureLoader.dll\" \"%{wks.location}/TLApp/src/extensions/TextureLoader\""
    }


    filter "files:vendor/libzip/lib/**.c"
	flags { "NoPCH" }

    filter "files:vendor/zlib/*.c"
	flags { "NoPCH" }

    filter { "system:windows" }
        systemversion "latest"

    filter { "configurations:Debug" }
        runtime "Debug"
        symbols "on"

    filter { "configurations:Release" }
        runtime "Release"
        optimize "on"