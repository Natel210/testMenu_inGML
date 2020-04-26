/// @description Insert description here
// You can write your code in this editor
global.pause = true;
global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);
//global.myroom = layer_get_target_room();

//room_set_width(global.myroom, global.view_width);
//room_set_height(global.myroom, global.view_height);

// 키보드 셋팅
global.key_revert = ord("X") ;
global.key_enter = vk_enter ;
global.key_left = vk_left;
global.key_right = vk_right;
global.key_up = vk_up;
global.key_down = vk_down;

display_set_gui_size(global.view_width, global.view_height);

enum menu_page 
{
	error = -1,
    main,
    settings,
    audio,
    difficulty,
    graphics,
    controls,
    height
}

enum menu_element_type
{
    type_error = -1,
    script_runner,
    page_transfer,
    slider,
    shift,
    toggle,
    input
}

//Create Menu Pages
ds_menu_main = SC_Create_Menu_Page(
    ["RESUME",      menu_element_type.script_runner,    resume_game],
    ["SETTING",     menu_element_type.page_transfer,    menu_page.settings],
    ["EXIT",        menu_element_type.script_runner,    exit_game]
);

ds_settings = SC_Create_Menu_Page(
    ["AUDIO",       menu_element_type.page_transfer,    menu_page.audio],
    ["DIFFICULTY",  menu_element_type.page_transfer,    menu_page.difficulty],
    ["GRAPHICS",    menu_element_type.page_transfer,    menu_page.graphics],
    ["CONTROLS",    menu_element_type.page_transfer,    menu_page.controls],
    ["BACK",        menu_element_type.page_transfer,    menu_page.main]
);

ds_menu_audio = SC_Create_Menu_Page(
    ["MASTER",      menu_element_type.slider,           change_volume,  1,  [0,1]],
    ["SOUNDS",      menu_element_type.slider,           change_volume,  1,  [0,1]],
    ["MUSIC",       menu_element_type.slider,           change_volume,  1,  [0,1]],
    ["BACK",        menu_element_type.page_transfer,    menu_page.settings]
);

ds_menu_difficulty = SC_Create_Menu_Page(
    ["ENEMIES",     menu_element_type.shift,           change_difficulty,  0,  
        ["HARMLESS", "NORMAL", "TERRIBLE"]],
    ["ALLIES",      menu_element_type.shift,           change_difficulty,  0,  
        ["DIM-WITTED", "NORMAL", "HELPFUL"]],
    ["BACK",        menu_element_type.page_transfer,    menu_page.settings]
);

ds_menu_graphics = SC_Create_Menu_Page(
    ["RESOLUTION",  menu_element_type.shift,           change_resolution,  0,
        ["384 x 216", "768 x 432", "1152 x 648", "1536 x 874", "1920 x 1080"]],
    ["WINDOW MODE", menu_element_type.toggle,           change_window_mode, 1,
        ["FULLSCREEN", "WINDOWED"]],
    ["BACK",        menu_element_type.page_transfer,    menu_page.settings]
);

ds_menu_controls = SC_Create_Menu_Page(
    ["UP",          menu_element_type.input,            "key_up",       vk_up],
    ["LEFT",        menu_element_type.input,            "key_left",     vk_left],
    ["RIGHT",       menu_element_type.input,            "key_right",    vk_right],
    ["DOWN",        menu_element_type.input,            "key_down",     vk_down],
    ["BACK",        menu_element_type.page_transfer,    menu_page.settings]
);


page = 0;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_difficulty,
    ds_menu_graphics, ds_menu_controls]


//매뉴 페이지의 속서들의 일괄 초기화
var i = 0;
var array_len = array_length_1d(menu_pages);
repeat(array_len)
{
    menu_option[i] = 0;
    ++i;
}

inputting = false;

// 음악 로딩
audio_group_load(MusicSound);
audio_group_load(EffectSound);