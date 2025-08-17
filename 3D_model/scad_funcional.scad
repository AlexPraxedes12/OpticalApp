$fn = 100;



// Parámetros del tubo

tube_length = 80;

tube_outer_radius = 20;

tube_inner_radius = 9;



// Parámetros de la lente

lens_diameter = 50;

lens_thickness = 3;



// Parámetros del LED

led_diameter = 5;

led_angle = 25;



// Parámetros del clip

phone_width = 73.2 + 0.5;

phone_thickness = 7.5 + 0.5;

clip_wall_thickness = 4;



// Alimentación

battery_diameter = 20;

battery_thickness = 3.2;

switch_width = 8.7;

switch_depth = 3.9;

switch_height = 5;



// ========== MÓDULOS CORREGIDOS ==========



module base_floor() {

    base_width = phone_width + (clip_wall_thickness * 2) + 15;

    base_depth = tube_outer_radius + phone_thickness + clip_wall_thickness;

    translate([-base_depth/2, -(phone_width/2 + clip_wall_thickness), 0])

        cube([base_depth, base_width, 2]);

}



module main_tube() {

    translate([0, 0, 0])

        cylinder(h = tube_length, r = tube_outer_radius);

}



module lens_holder() {

    translate([0, 0, tube_length - 6.5]) {

        union() {

            // Parte que entra al tubo para asegurar fusión

            cylinder(h = 6.5 + lens_thickness + 2, r = tube_outer_radius);



            // Extensión para lente

            translate([0, 0, 6.5]) {

                cylinder(h = lens_thickness + 2, r = (lens_diameter / 2) + clip_wall_thickness);

                translate([0, 0, lens_thickness + 2]) {

                    cylinder(h = 2, r1 = lens_diameter / 2, r2 = (lens_diameter / 2) - 2);

                }

            }

        }

    }

}



module phone_clip() {

    clip_height = phone_width + (clip_wall_thickness * 2);

    clip_depth = tube_outer_radius + phone_thickness + clip_wall_thickness;

    translate([-clip_depth / 2, -clip_height / 2, 0])

        cube([clip_depth, clip_height, 15]);

}



module power_compartment() {

    translate([-(tube_outer_radius + phone_thickness + clip_wall_thickness)/2, 

               (phone_width/2) + clip_wall_thickness, 0])

        cube([30, 15, 15]);

}



// ========== ENSAMBLAJE Y PERFORACIONES ==========



difference() {

    union() {

        base_floor();

        main_tube();

        lens_holder();

        phone_clip();

        power_compartment();

    }



    // Hueco central tubo

    translate([0, 0, -1])

        cylinder(h = tube_length + 10, r = tube_inner_radius);



    // Hueco lente

    translate([0, 0, tube_length + 1])

        cylinder(h = lens_thickness + 6, r = lens_diameter / 2);



    // Hueco LED

    translate([0, 0, tube_length - 15])

        rotate([led_angle, 0, 0])

            translate([0, tube_outer_radius - 2, -20])

                cylinder(h = 40, r = led_diameter / 2);



    // Canal teléfono

    translate([-(tube_outer_radius + phone_thickness)/2, -phone_width/2, -1])

        cube([tube_outer_radius + phone_thickness, phone_width, 18]);



    // Hueco batería

    translate([-(tube_outer_radius + phone_thickness + clip_wall_thickness)/2 + 15, 

               (phone_width/2) + clip_wall_thickness + 7.5, 8]) {

        rotate([90, 0, 0]) {

            cylinder(h = battery_thickness + 2, r = battery_diameter/2);

            translate([0, (battery_diameter/2) - 2, -1])

                cube([5, 5, battery_thickness + 3]);

        }

    }



    // Hueco interruptor

    translate([-(tube_outer_radius + phone_thickness + clip_wall_thickness)/2 + 5, 

               (phone_width/2) + clip_wall_thickness + 15, 

               7.5 - switch_height/2])

        cube([switch_depth, switch_width, switch_height]);

}