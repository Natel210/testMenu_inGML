//show_debug_message("change_volume"+string(argument0));


var type = menu_option[page];

switch (type) {
	case 0:
		audio_master_gain(argument0);
		break;
	case 1:
		audio_group_set_gain(EffectSound, argument0, 0);
		break;
	case 2:
	audio_group_set_gain(MusicSound, argument0, 0);
		break;
	case 3:
		break;
	default:
		break;
}
