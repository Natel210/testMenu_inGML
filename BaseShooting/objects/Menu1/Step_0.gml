/// @description Insert description here
// You can write your code in this editor
if(!global.pause)
{
    exit;
}

//프래스가 됬다면 1 아니면 0 
input_up_p = keyboard_check_pressed(global.key_up);
input_down_p = keyboard_check_pressed(global.key_down);
input_enter_p = keyboard_check_pressed(global.key_enter);

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);

if (true == inputting) {
	switch (ds_grid[# 1, menu_option[page]]) 
	{
	case menu_element_type.type_error:	break;
//	case menu_element_type.script_runner:	break;
//	case menu_element_type.page_transfer:	break;
	case menu_element_type.shift:
		var hinput =keyboard_check_pressed(global.key_right) -keyboard_check_pressed(global.key_left);
		if (hinput != 0) {
			ds_grid[# 3, menu_option[page]] += hinput;
			ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 
				0 ,array_length_1d(ds_grid[# 4, menu_option[page]])-1);
		}
		break;
	case menu_element_type.slider:
		switch (menu_option[page]) {
		    case 0:
				if (!audio_is_playing(S_Car1)) 
				{
					audio_play_sound(S_Car1, 1, false);
				}
		        break;
			case 1:
				if (!audio_is_playing(S_Screem_4)) 
				{
					audio_play_sound(S_Screem_4, 1, false);
				}
		        break;
			case 2:
				if (!audio_is_playing(_vietsub__we_are___tvxq__one_piece_ost___128__kbps_)) 
				{
					audio_play_sound(_vietsub__we_are___tvxq__one_piece_ost___128__kbps_, 1, false);
				}
		        break;
		    default:
		        // code here
		        break;
		}
		var hinput =keyboard_check(global.key_right) -keyboard_check(global.key_left);
		if (hinput != 0) {
			ds_grid[# 3, menu_option[page]] += hinput*0.01;
			ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
		}
		break;
		
	case menu_element_type.toggle:
		var hinput =keyboard_check(global.key_right) -keyboard_check(global.key_left);
		if (hinput != 0) {
			ds_grid[# 3, menu_option[page]] += hinput;
			ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
		}
		break;
	case menu_element_type.input:
		var kk= keyboard_lastkey;
		if(kk != vk_enter)
		{
			if(kk != ds_grid[# 3, menu_option[page]] )
			{
				ds_grid[# 3, menu_option[page]] = kk;
				variable_global_set(ds_grid[# 2, menu_option[page]], kk);
			}
			

		}
		break;
	default:
	    break;
	}
	
	
	
	if (input_enter_p) 
	{
		switch (ds_grid[# 1, menu_option[page]]) 
		{
			case menu_element_type.shift:
			case menu_element_type.slider:
			case menu_element_type.toggle:
				if(inputting)
				{
					script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); 
				}
				break;
	        default:
	            break;
		}
		inputting = !inputting;
	}
	
}
else
{
	var  ochange = input_down_p - input_up_p;
	if (ochange != 0) 
	{
	    // code here
	    menu_option[page] += ochange;
	    
	    if (menu_option[page] > ds_height -1 ) 
	    {
	        menu_option[page] = 0;
	    }
	    
	    if (menu_option[page] < 0) 
	    {
	        menu_option[page] = ds_height -1 ;
	    }
	}
	//인풋 확인용 디버깅세팅 
	//else if( input_enter_p == 1)
	else if( (input_down_p + input_up_p) == 2)
	{
	    // code here
	    error_code = "input_down_p + input_up_p";
	    error_code_time = 2.0;
	}
	
	if (input_enter_p) 
	{
	    switch (ds_grid[# 1, menu_option[page]]) 
		{
	        case menu_element_type.type_error:
	            break;
			case menu_element_type.script_runner:
				script_execute(ds_grid[# 2, menu_option[page]]);
				break;
	        case menu_element_type.page_transfer:
	            page = ds_grid[# 2, menu_option[page]];
	            break;
			case menu_element_type.shift:
			case menu_element_type.slider:
			case menu_element_type.toggle:
				if(inputting)
				{
					script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); 
				}
				//break;
			case menu_element_type.input:
				inputting = !inputting;
				break;
	        default:
	            break;
	    }
	}
}