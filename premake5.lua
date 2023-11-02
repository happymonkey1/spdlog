project "spdlog"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    staticruntime "off"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    defines
    {
        "SPDLOG_COMPILED_LIB"
    }

    files
    {
        "spdlog/**.h",
        "spdlog/**.cpp",
        "src/**.cpp",
        -- external fmt lib because of MSVC 17.7 bug
        "../fmt/include/**.h",
    }

    includedirs
    {
        "include",
        -- external fmt lib because of MSVC 17.7 bug
        "../fmt/include",
    }
    
    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        --staticruntime "on"
