//show_debug_message("change_resolution");


switch (argument0) 
{
	case 0:
		window_set_size(348,216);
		break;
	case 1:
		window_set_size(768,432);
		break;
	case 2:
		window_set_size(1152,648);
		break;
	case 3:
		window_set_size(1536,874);
		break;
	case 4:
		window_set_size(1920,1080);
		break;
    default:
        // code here
        break;
}