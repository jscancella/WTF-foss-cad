module upper(t=[0,0,0],r=[0,0,0]){
	translate(t)
	rotate(r)
	union(){
		difference(){
			color(upper_color)
			import(upper_location, convexity=set_convexity);
			translate([0.01,0,0])			//Necessary to prevent non-manifold objects from zero thickness differences
			color(upper_feature_color)
			import(barrel, convexity=4);
			color(upper_feature_color)
			import(retainer_negative,convexity=set_convexity);
			if(!Emboss_text){
				large_letters();
				small_letters();
			}
			if(!Emboss_logo){
				logo();
			}
			if(!Emboss_badge){
				badge();
			}
		}
		if(Emboss_text){
		large_letters();
		small_letters();
		}
		if(Emboss_logo){
		logo();
		}
		if(Emboss_badge){
		badge();
		}
	}
	
	
	module large_letters(t=[0,0,0],r=[0,0,0],s=12,f=Big_text_font){
		color(upper_feature_color)
		translate([-43+t[0],19.35+t[1],3+t[2]])
		rotate([90+r[0],0+r[1],180+r[2]])
		linear_extrude(height=1.5,center=false)
		text(Big_text,size=s,font=f,halign="center", valign="center");
	}
	
	module small_letters(t=[0,0,0],r=[0,0,0],s=3,f=Small_text_font){
		color(upper_feature_color)
		translate([-125+t[0],19.35+t[1],-10+t[2]])
		rotate([90+r[0],0+r[1],180+r[2]])
		linear_extrude(height=1.5,center=false)
		text(Small_text,size=s,font=f,halign="center", valign="center");	
	}
	
	module logo(t=[0,0,0],r=[0,0,0]){
		if(len(logo_location)>6){
			color(upper_feature_color)
			intersection(){
				translate([-160+t[0],0+t[1],-17+t[2]])
				rotate([90+r[0],0+r[1],0+r[2]])
				linear_extrude(height=23,center=false,convexity=set_convexity)
				import(logo_location);
				import(logo_mask);
			}
		}
	}
	
	module badge(t=[0,0,0],r=[0,0,0]){
		if(len(badge_location)>7){
			color(upper_feature_color)
			intersection(){
				translate([0+t[0],-24+t[1],18+t[2]])
				rotate([65+r[0],0+r[1],0+r[2]])
				linear_extrude(height = 7, center = true, convexity =set_convexity)
				import(file=badge_location);
				import(logo_mask);
			}
		}
	}
}

module barrel_retainer(t=[0,0,0],r=[0,0,0]){//Barrel Retainer
	translate(t)
	rotate(r)
	difference(){
		color(hand_guard_color)
		union(){
			import(retainer_buck, convexity=set_convexity);
			import(retainer_positive, convexity=set_convexity);
		}
		color(hand_guard_feature_color)
		import(retainer_negative,convexity=set_convexity);
		color(hand_guard_feature_color)
		translate([0,0,-0.01])				//Necessary to prevent non-manifold objects from zero thickness differences
		import(barrel, convexity=set_convexity);
		}
	}

module mag_well(t=[0,0,0],r=[0,0,0]){
    translate(t)
	rotate(r)
	if(Stipple_emboss){
		difference(){
			union(){
				mag_base();
				color(mag_well_feature_color)
				mag_stipple();
				color(mag_well_color)
				import(front_surface_positive, convexity=set_convexity);
			}
		color(mag_well_color)
		import(front_surface_negative, convexity=set_convexity);
		}
	}
	else{
		difference(){
			union(){
				difference(){
					mag_base();
					color(mag_well_feature_color)
					mag_stipple();
				}
				color(mag_well_color)
				import(front_surface_positive, convexity=set_convexity);
			}
			color(mag_well_color)
			import(front_surface_negative, convexity=set_convexity);
		}
	}
}

module lower_receiver(t=[0,0,0],r=[0,0,0]){
	color(lower_color)
    translate(t)
	rotate(r)
	import(lower_location,convexity=set_convexity);
}

module stipple_mask(){
	union(){
		import(stipple_mask_front,convexity=set_convexity);
		import(stipple_mask_side,convexity=set_convexity);
	}
}

module mag_stipple(){

    if(len(stipple)>12){
		color(mag_well_feature_color)
		intersection(){
			union(){
				translate([-75,0,-130])
				rotate([90,0,0])
				scale([Stipple_Scale_Factor,Stipple_Scale_Factor,1])
				linear_extrude (height = 25, center=false,convexity=set_convexity)
				import(stipple);
				translate([35,0,-130])
				rotate([90,0,180])
				scale([Stipple_Scale_Factor,Stipple_Scale_Factor,1])
				linear_extrude (height = 25, center=false,convexity=set_convexity)
				import(stipple);
			}
		import(stipple_mask_side,convexity=set_convexity);
		}
		
    }
}

module mag_ridges(){
	difference(){
		import(front_surface_positive, convexity=set_convexity);
		import(front_surface_negative, convexity=set_convexity);
	}
}

module mag_base(){
	color(mag_well_color)
	import(magwell, convexity=set_convexity);
}

module endcap(t=[0,0,0],r=[0,0,0]){
	translate(t)
	rotate(r)
	color(cap_color)
	import(endcap_location,convexity=set_convexity);
}

module bits_and_bobs(t=[0,0,0],r=[0,0,0]){
	magazine_release();
	magazine_button();
	feed_ramp();
	buffer_cap();
	bolt_carrier();
	charging_handle();
}

module feed_ramp(t=[0,0,0],r=[0,0,0]){
	tp=[-110,100,5];
	rp=[90,0,0];
	translate(Separate_for_Plating?tp:t)
	rotate(Separate_for_Plating?rp:r)
	color(bits_color)
	import(feed_ramp_location,convexity=set_convexity);
}

module magazine_release(t=[0,0,0],r=[0,0,0]){
	tp=[-20,45,23.2];
	rp=[90,0.7,0];
	translate(Separate_for_Plating?tp:t)
	rotate(Separate_for_Plating?rp:r)
	color(bits_color)
	import(mag_release,convexity=set_convexity);
}

module magazine_button(t=[0,0,0],r=[0,0,0]){
	tp=[-90,190,25.5];
	rp=[-90,0,0];
	translate(Separate_for_Plating?tp:t)
	rotate(Separate_for_Plating?rp:r)
	color(bits_color)
	import(mag_button,convexity=set_convexity);
}

module buffer_cap(t=[0,0,0],r=[0,0,0]){
	tp=[-200,150,-138.73];
	rp=[0,90,0];
	translate(Separate_for_Plating?tp:t)
	rotate(Separate_for_Plating?rp:r)
	color(bits_color)
	import(buffer_cap_location,convexity=set_convexity);
}

module bolt_carrier(t=[0,0,0],r=[0,0,0]){
	tp=[-195,78,77.3];
	rp=[0,-90,-70];
	translate(Separate_for_Plating?tp:t)
	rotate(Separate_for_Plating?rp:r)
	difference(){
		color(bits_color)
		import(bolt_carrier_location,convexity=set_convexity);
		bolt_carrier_text();
	}
	
	module bolt_carrier_text(t=[0,0,0],r=[0,0,0],s=12,f=str(Bolt_carrier_font)){
		color(bits_color + highlight_color)
		translate([-30.5+t[0],-11.93+t[1],3+t[2]])
		rotate([90+r[0],0+r[1],0+r[2]])
		linear_extrude(height=1.5,center=false)
		text(Bolt_carrier_text,size=s,font=f,halign="center", valign="center");
	}
}

module charging_handle(t=[0,0,0],r=[0,0,0]){
	tp=[-180,100,-80.83];
	rp=[0,-90,0];
	translate(Separate_for_Plating?tp:t)
	rotate(Separate_for_Plating?rp:r)
	color(bits_color)
	import(charging_handle_location,convexity=set_convexity);
}