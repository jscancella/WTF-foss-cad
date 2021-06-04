/* [Main Options] */
//Click here to prepare the model for printing
Separate_for_Plating=false;

Render_Upper=true;

Render_Retainer=true;

Render_Lower=true;

Render_Magwell=true;

Render_Endcap=true;

Render_Bits_and_Bobs=true;

//Choose which barrel you have
Barrel_choice="RP9"; //["RP9":RP9, "Glock17":Gen 1-4 Glock 17, "Glockgen5":Gen5 Glock 17,"SW9VE":SW9VE,"CH9T":Chazel 9mm liner,"ECM":ECM]
//Use this option for barrels that have large diameter chambers like ECM and liners
Large_barrel=false;

/*[Upper Options]*/

Upper_color=[5,5,4]; //[0:1:10]

//Choose a Logo for the Upper
Logo_choice="Xv3.svg";//["AheagoMod9.svg":Aheago,"ATFMod9.svg":ATF,"awcycrossends.svg":AWCY Crossends,"AWCYGirlMod9.svg":AWCY Girl,"Brawndo.svg":Brawndo,"FishMod9.svg":Fish Scales, "hetda.svg":Hetda, "hoodrat.svg":Hoodrat,"PicassoMod9.svg":Picasso,"PietMondrianMod9.svg":Piet Mondrian,"ScreamMod9.svg":The Scream,"SnakeMod9.svg":Snakeskin,"SnufgunMod9.svg": Snuf Gun,"TigerMod9.svg":Tiger Stripes,"Xv3.svg":X v3,"awcy.svg":AWCY?,"":Blank]

//Choose your badge image
Badge_choice= ""; //["":Blank,"Baba_Yaga.svg":Baba Yaga,"Camacho.svg":Camacho,"Doge.svg":Doge,"helmet.svg":Spartan Helmet,"Hornet.svg":Hornet,"Cobra.svg":BONUS-Cobra]


//Choose Large lettering
Big_text = "";

//Choose Small lettering
Small_text = "";

//Emboss or engrave text
Emboss_text=false;

//Emboss or engrave logo
Emboss_logo=false;

//Emboss or engrave badge
Emboss_badge=false;

/*[Hand Guard Options]*/

Hand_guard_color=[1,1,1]; //[0:1:10]

Hand_guard="v3";		//["v3":v3 Hand Guard,"v2":v2 Hand Guard,"mod":Mod Hand Guard]


/*[Mag Well Options]*/
Mag_well_color = [5,5,4]; //[0:1:10]

Mag_well_choice = "g17full"; 	//["g17slim":Slim Glock 17,"g17full":Full Glock 17,"g43":Glock 43]

//Select your stipple
Stipple_Choice= ""; //["":Blank,"MOD9MOD9.svg":MOD9MOD9,"hex5000x500um.svg":Hex,"tri-stipple.svg":Tri-Stipple,"lvx.svg":Lewis Vitton,"Dicks001.svg":Dicks,"dickbutt.svg":dickbutt,"FishScalesStipple.svg":Fish Scales,"SnakeStipple.svg":Snake Skin,"TigerStipple.svg":Tiger Stripes]
Stipple_emboss = false;

Front_surface = "ridges"; //["ridges":Ridges,"":Blank]

/*[Lower Options]*/
Lower_color = [1,1,1]; //[0:1:10]

/*[End Cap Options]*/
Endcap_color = [1,1,1]; //[0:1:10]
Endcap_choice="v3shockcap"; //["v3shockcap":v3 Shock,"v3extendedshockcap":v3 Extended Shock]
//RC_shock_buffer=true;


/*[Bits and Bobs]*/
Bits_color = [1,1,1];	//[0:1:10]
Bolt_carrier_text = "MOD9";

/* [Developer Options] */

set_convexity = 3;//[1:1:10]

Big_text_font = "Arial";
Small_text_font = "Arial";
Bolt_carrier_font = "Arial";

//Check if you want to designate your own logo
Custom_logo=false;
Logo_name="";

//Check if you want to designate your own badge image
Custom_badge=false;
Badge_name = "";

//Check if you want to designate your own stipple pattern
Custom_Stipple= false;
Stipple_Name = "";
Stipple_Scale_Factor=1.00;//[1.0:0.1:5.0]

Highlights = 5; //[1:1:10]



///////////////DONE WITH CUSTOMIZER OPTIONS/////////////////////////

include <modules.scad>;
//use <New/font/location.ttf> //use '/' instead of '\' for folder separators
module done(){};

highlight_color = [Highlights * 0.02,Highlights * 0.02,Highlights * 0.02,];
upper_location = "models/upper_receiver.stl";
upper_color	= 0.1 * Upper_color;
upper_feature_color = upper_color + highlight_color;
logo_mask="models/logo_mask.stl";
badge_location = str("badge/",Custom_badge ? Badge_name : Badge_choice);
logo_location=str("logo/",Custom_logo ? Logo_name : Logo_choice);
barrel = str("models/",Barrel_choice,"barrel.stl");
feed_ramp_location = str("models/",Barrel_choice,"feedramp.stl");
hand_guard_color = 0.1 * Hand_guard_color;
hand_guard_feature_color = hand_guard_color + highlight_color;
retainer_buck = str("models/",Hand_guard,"retainer.stl");
retainer_positive = str("models/",Hand_guard,"retainer",Large_barrel ? "expanded" : "standard","positive.stl");
retainer_negative = str("models/","retainer",Large_barrel ? "expanded" : "standard","negative.stl");
mag_well_color = 0.1 * Mag_well_color ;
mag_well_feature_color = mag_well_color + highlight_color;
magwell=str("models/",Mag_well_choice,"magwell.stl");
lower_location = "models/lower_receiver.stl";
front_surface_positive = str(Front_surface=="" ? "" : "models/",Mag_well_choice,"front",Front_surface,"positive.stl");
front_surface_negative = str(Front_surface=="" ? "" : "models/",Mag_well_choice,"front",Front_surface,"negative.stl");
stipple_mask_front = str("models/",Mag_well_choice,"frontmask.stl");
stipple_mask_side=str("models/",Mag_well_choice,"sidemask.stl");
checkering_side=str("models/",Mag_well_choice,"sidecheckering.stl");
stipple = str("stipple/",Custom_Stipple ? Stipple_Name : Stipple_Choice);
lower_color = 0.1 * Lower_color;
lower_feature_color = lower_color + highlight_color;
endcap_color = Endcap_color * 0.1 ;
bits_color = Bits_color * 0.1 ;
mag_release = str("models/",Mag_well_choice,"magrelease.stl");
mag_button = str("models/",Mag_well_choice,"magbutton.stl");
endcap_location = str("models/",Endcap_choice,".stl");
cap_color = 0.1 * Endcap_color;
buffer_cap_location = "models/buffercap.stl";
bolt_carrier_location = "models/boltcarrier.stl";
charging_handle_location = "models/charginghandle.stl";


//Render Time
if(!Separate_for_Plating){
	if(Render_Upper)upper(t=[0,0,0],r=[0,0,0]);
	if(Render_Retainer)barrel_retainer(t=[0,0,0],r=[0,0,0]);
	if(Render_Magwell)mag_well(t=[0,0,0],r=[0,0,0]);
	if(Render_Lower)lower_receiver(t=[0,0,0],r=[0,0,0]);
	if(Render_Bits_and_Bobs)bits_and_bobs(t=[0,0,0],r=[0,0,0]);
	if(Render_Endcap)endcap(t=[0,0,0],r=[0,0,0]);
}

if(Separate_for_Plating){
	if(Render_Upper)upper(t=[-55,120,31.73],r=[0,90,0]);
	if(Render_Retainer)barrel_retainer(t=[-55,40,117],r=[0,90,0]);
	if(Render_Magwell)mag_well(t=[-135,40,-31.7],r=[180,0,0]);
	if(Render_Lower)lower_receiver(t=[-35,185,-17.7],r=[180,0,0]);
	if(Render_Endcap)endcap(t=[-140,120,232.83],r=[0,-90,90]);
	if(Render_Bits_and_Bobs)bits_and_bobs(t=[0,0,0],r=[0,0,0]);
}