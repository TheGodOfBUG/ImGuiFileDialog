project "ImGuiFileDialog"
	kind "StaticLib"
	language "C++"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"**.cpp",
		"**.h",
		"**.hpp",
	}

	includedirs
    {
        "../imgui",
        "../stb_image",
		"../GLFW/include",
		"../GLAD/include"
    }

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		defines
		{
			"IMGUI_IMPL_OPENGL_LOADER_GLAD"
		}

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
