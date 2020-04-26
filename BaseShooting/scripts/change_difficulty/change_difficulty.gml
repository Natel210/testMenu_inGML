//show_debug_message("change_difficulty");



var type = menu_option[page];

if (type == 0) 
{
    // 적군 
	switch (argument0) 
	{
		case 0:	//쉬움 
			global.enemy_health = 1;
			break;
		case 1:	//보통 
			global.enemy_health = 2;
			break;
		case 2:	//어려움 
			global.enemy_health = 3;
			break;
		default:
			break;
	}
}
else 
{
    // 아군 
	switch (argument0) 
	{
		case 0:	//쉬움 
			global.allies_health = 1;
			break;
		case 1:	//보통 
			global.allies_health = 2;
			break;
		case 2:	//어려움 
			global.allies_health = 3;
			break;
		default:
			break;
	}
}