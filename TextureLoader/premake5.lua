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

        "vendor/libzippp/src/libzippp.cpp",
        "vendor/libzippp/src/libzippp.h"
    }
    
    links {
        "vendor/zlib/lib/%{cfg.buildcfg}/zlib.lib",
        "vendor/libzip/lib/%{cfg.buildcfg}/zip.lib"
    }

    includedirs {
        "src",
        "vendor/libzippp/src",
        "vendor/zlib/include",
        "vendor/libzip/include"
    }

    postbuildcommands {
        "{COPY} \"%{cfg.targetdir}/TextureLoader.dll\" \"%{wks.location}/TLApp/src/extensions/TextureLoader\"",
        "{COPY} \"vendor/libzip/bin/%{cfg.buildcfg}/zip.dll\" \"%{wks.location}/TLApp/src/extensions/TextureLoader\"",
        "{COPY} \"vendor/zlib/bin/%{cfg.buildcfg}/zlib.dll\" \"%{wks.location}/TLApp/src/extensions/TextureLoader\""
    }


    filter "files:vendor/libzippp/src/libzippp.cpp"
	flags { "NoPCH" }

    filter { "system:windows" }
        systemversion "latest"

    filter { "configurations:Debug" }
        runtime "Debug"
        symbols "on"

    filter { "configurations:Release" }
        runtime "Release"
        optimize "on"