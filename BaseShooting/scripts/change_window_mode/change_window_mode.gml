show_debug_message("change_window_mode");

switch(argument0)
{
	case 0: window_set_fullscreen(true); break;
	case 1: window_set_fullscreen(false); break;
}