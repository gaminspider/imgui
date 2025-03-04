---@diagnostic disable: undefined-global

project "imgui"
	kind "StaticLib"

	targetdir ("bin/" .. Outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. Outputdir .. "/%{prj.name}")

	files
	{
		"imgui.cpp",
		"imgui_demo.cpp",
		"imgui_draw.cpp",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
        "imconfig.h",
        "imgui.h",
        "imgui_internal.h",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",

        -- Add backends (for now GLFW and Vulkan)
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_opengl3.h",
        "backends/imgui_impl_vulkan.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_opengl3.cpp",
        "backends/imgui_impl_vulkan.cpp"
    }

	includedirs
	{
		".",
        "backends",
        "../../vendor/glfw/include",
        "%{IncludeDirs.Vulkan}"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		filter { "system:windows", "configurations:Release" }
		 buildoptions "/MT"
