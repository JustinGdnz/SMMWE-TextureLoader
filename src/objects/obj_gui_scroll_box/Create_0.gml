/// @description 

// Box size
box_width = sprite_width;
box_height = sprite_height;

// Box surface
surf = surface_create(box_width, box_height);

// Text
element = scribble("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pulvinar, felis non faucibus accumsan, erat libero luctus metus, malesuada mollis risus metus et ex. Duis pulvinar porttitor est ac iaculis. Phasellus quis tellus ac elit rutrum lobortis. Aliquam ultricies ipsum vel dictum maximus. Morbi vel dolor quam. Duis in mauris interdum, mattis odio vitae, congue risus. Vivamus luctus risus vitae neque venenatis, ac dignissim magna accumsan. Nullam a tristique sapien, et placerat turpis. Quisque fermentum orci a dignissim congue. Vivamus eget justo nec mauris egestas ultricies. Praesent lacinia sodales tempus. Sed vitae varius enim. Cras mollis convallis arcu, ac egestas elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pulvinar, felis non faucibus accumsan, erat libero luctus metus, malesuada mollis risus metus et ex. Duis pulvinar porttitor est ac iaculis. Phasellus quis tellus ac elit rutrum lobortis. Aliquam ultricies ipsum vel dictum maximus. Morbi vel dolor quam. Duis in mauris interdum, mattis odio vitae, congue risus. Vivamus luctus risus vitae neque venenatis, ac dignissim magna accumsan. Nullam a tristique sapien, et placerat turpis. Quisque fermentum orci a dignissim congue. Vivamus eget justo nec mauris egestas ultricies. Praesent lacinia sodales tempus. Sed vitae varius enim. Cras mollis convallis arcu, ac egestas elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pulvinar, felis non faucibus accumsan, erat libero luctus metus, malesuada mollis risus metus et ex. Duis pulvinar porttitor est ac iaculis. Phasellus quis tellus ac elit rutrum lobortis. Aliquam ultricies ipsum vel dictum maximus. Morbi vel dolor quam. Duis in mauris interdum, mattis odio vitae, congue risus. Vivamus luctus risus vitae neque venenatis, ac dignissim magna accumsan. Nullam a tristique sapien, et placerat turpis. Quisque fermentum orci a dignissim congue. Vivamus eget justo nec mauris egestas ultricies. Praesent lacinia sodales tempus. Sed vitae varius enim. Cras mollis convallis arcu, ac egestas elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pulvinar, felis non faucibus accumsan, erat libero luctus metus, malesuada mollis risus metus et ex. Duis pulvinar porttitor est ac iaculis. Phasellus quis tellus ac elit rutrum lobortis. Aliquam ultricies ipsum vel dictum maximus. Morbi vel dolor quam. Duis in mauris interdum, mattis odio vitae, congue risus. Vivamus luctus risus vitae neque venenatis, ac dignissim magna accumsan. Nullam a tristique sapien, et placerat turpis. Quisque fermentum orci a dignissim congue. Vivamus eget justo nec mauris egestas ultricies. Praesent lacinia sodales tempus. Sed vitae varius enim. Cras mollis convallis arcu, ac egestas elit. ", "BOX_"+string(random(100000)));

// Wrap text to box
element.wrap(box_width);

// Text box
text_width = element.get_width();
text_height = element.get_height();

// Text position
text_y = 0;

// Scroll
scroll_y = 0;
scroll_size = box_height / text_height;
scroll_speed = 1;

// Wheel
wheel_speed = 6;

if (scroll_size < 0.1)
	scroll_speed = 0.1 / scroll_size;

scroll_size = clamp(scroll_size, 0.1, 1);

// Mouse interaction
select = false;
scroll_offset = 0;