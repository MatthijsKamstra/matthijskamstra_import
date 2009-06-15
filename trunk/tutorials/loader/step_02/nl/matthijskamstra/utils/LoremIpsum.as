package nl.matthijskamstra.utils {

	/**
	* based upon bumpslide LorumIpsum
	* and added some extra stuff
	* @author Matthijs Kamstra aka [mck]
	*/

	/**
	 * Some Lorem Ipsum Text
	 * 
	 * @author David Knape
	 */
	public class LoremIpsum {
		
		
		public static const COLORS:Array = [  
			0x81B3C3,  
			0xDF6559,  
			0xF9D574,  
			0xF29F43,  
			0x253C4B,  
			0xffffff];
			
		public static const BIRDS:Array = [ 	
			'Anseriformes—waterfowl',		
			'Galliformes—fowl',
			'Charadriiformes—gulls, button-quails, plovers and allies',
			'Gaviiformes—loons',
			'Podicipediformes—grebes',
			'Procellariiformes—albatrosses, petrels, and allies',
			'Sphenisciformes—penguins',
			'Pelecaniformes—pelicans and allies',
			'Phaethontiformes—tropicbirds',
			'Ciconiiformes—storks and allies',
			'Cathartiformes—New World vultures',
			'Phoenicopteriformes—flamingos',
			'Falconiformes—falcons, eagles, hawks and allies',
			'Gruiformes—cranes and allies',
			'Pteroclidiformes—sandgrouse',
			'Columbiformes—doves and pigeons',
			'Psittaciformes—parrots and allies',
			'Cuculiformes—cuckoos and turacos',
			'Opisthocomiformes—hoatzin',
			'Strigiformes—owls',
			'Caprimulgiformes—nightjars and allies',
			'Apodiformes—swifts and hummingbirds',
			'Coraciiformes—kingfishers and allies',
			'Piciformes—woodpeckers and allies',
			'Trogoniformes—trogons',
			'Coliiformes—mousebirds',
			'Passeriformes—passerines' 
		];
		
		public static const ITEMS:Array = [
			"Lorem Ipsum",
			"Consectetuer",
			"Aenean Volutpat",
			"Suspendisse",
			"Maecenas Nec",
			"Quisque",
			"Facilisis"
		];
		
		// OMG! Puppies...
		public static const PUPPY_IMAGES:Array = [
			'http://farm1.static.flickr.com/62/169028344_d8cc82370a_m.jpg',
			'http://farm1.static.flickr.com/58/222354132_659731b878_m.jpg',
			'http://farm1.static.flickr.com/168/378717376_898541a616_m.jpg',
			'http://farm1.static.flickr.com/249/455063464_2632604654_m.jpg',
			'http://farm1.static.flickr.com/74/224089051_5f49edca66_m.jpg',
			'http://farm2.static.flickr.com/1405/696005226_e8c5701231_m.jpg',
			'http://farm1.static.flickr.com/182/425784378_0922d92869_m.jpg',
			'http://farm1.static.flickr.com/79/232413904_e68c5c6f81_m.jpg',
			'http://farm1.static.flickr.com/22/146828640_463b12e9af_m.jpg',
			'http://farm1.static.flickr.com/81/210745901_5001dbb181_m.jpg',
			'http://farm1.static.flickr.com/208/470861757_1f105d1a82_m.jpg',
			'http://farm1.static.flickr.com/153/329760677_61f73cd9be_m.jpg',
			'http://farm1.static.flickr.com/162/335588286_f67ed8c9f9_m.jpg',
			'http://farm1.static.flickr.com/2/3852131_e938da141e_m.jpg',
			'http://farm1.static.flickr.com/213/498282225_9e7065ffbc_m.jpg',
			'http://farm1.static.flickr.com/125/354825172_5ae46d39c7_m.jpg',
			'http://farm1.static.flickr.com/69/229809551_9387069001_m.jpg',
			'http://farm3.static.flickr.com/2113/2252583296_1d49e632eb_m.jpg',
			'http://farm1.static.flickr.com/35/110844889_b5b671e307_m.jpg',
			'http://farm1.static.flickr.com/68/215516482_e9305ff6ba_m.jpg',
			'http://farm1.static.flickr.com/55/111261571_f2cee54b61_m.jpg',
			'http://farm1.static.flickr.com/159/414468522_4843172d17_m.jpg',
			'http://farm1.static.flickr.com/57/214533035_684da58e56_m.jpg',
			'http://farm1.static.flickr.com/16/88778660_de38e09808_m.jpg'     
		];
		
		
		
		// search for mecha
		public static const MECHA_IMAGES:Array = [
			'http://farm4.static.flickr.com/3405/3624937787_0a67feaf07_o_d.png',
			'http://farm4.static.flickr.com/3234/2305400257_c5483b2a12_o_d.jpg',
			'http://farm4.static.flickr.com/3528/3463728309_2c2b606417_b_d.jpg',
			'http://farm4.static.flickr.com/3232/3072607716_5071cec7d7_o_d.jpg',
			'http://farm2.static.flickr.com/1356/943594860_6a09c0f219_o_d.jpg',
			'http://farm4.static.flickr.com/3594/3401764605_7a5932da4d_o_d.jpg',
			'http://farm4.static.flickr.com/3333/3545958990_b934f407ed_o_d.jpg',
			'http://farm3.static.flickr.com/2164/2162279672_4bd6c0320a_o_d.jpg',
			'http://farm4.static.flickr.com/3122/3153496808_89cb459793_o_d.jpg',
			'http://farm4.static.flickr.com/3024/3007664368_bf9dfc1f91_o_d.jpg',
			'http://farm3.static.flickr.com/2131/2254465076_c7f299e75a_o_d.jpg',
			'http://farm4.static.flickr.com/3417/3556925362_1df3d017e1_o_d.jpg',
			'http://farm4.static.flickr.com/3109/2643048368_53795a96ec_b_d.jpg',
			'http://farm4.static.flickr.com/3658/3489281844_3c9b80c8bf_o_d.jpg',
			'http://farm4.static.flickr.com/3417/3552204525_2708e97501_o_d.jpg',
			'http://farm4.static.flickr.com/3543/3495128722_668bd23eba_b_d.jpg',
			'http://farm1.static.flickr.com/137/380449633_75f201d06b_o_d.jpg',
			'http://farm4.static.flickr.com/3115/2674695466_cea1a1f61f_o_d.jpg',
			'http://farm1.static.flickr.com/50/165116253_9257797ecf_o_d.jpg',
			'http://farm1.static.flickr.com/140/320388353_a1b09e52df_o_d.jpg',
			'http://farm3.static.flickr.com/2334/2201196802_2caaa48c57_o_d.jpg',
			'http://farm4.static.flickr.com/3043/2316651587_c2491d2520_o_d.jpg',
			'http://farm2.static.flickr.com/1028/1081561609_dae826b702_o_d.jpg',
			'http://farm1.static.flickr.com/14/18515877_dd1024007f_o_d.jpg',
			'http://farm1.static.flickr.com/3/4498512_d926efeee0_o_d.jpg',
			'http://farm1.static.flickr.com/23/40602286_3115ca89bf_o_d.jpg',
			'http://farm1.static.flickr.com/35/73846381_af2971b778_o_d.jpg',
			'http://farm1.static.flickr.com/39/74049551_0715eaf666_o_d.jpg',
			'http://farm3.static.flickr.com/2095/2283279922_f048218ebc_o_d.jpg',
			'http://farm3.static.flickr.com/2201/1897335518_0fa15de79c_o_d.jpg',
			'http://farm1.static.flickr.com/110/365082735_2f9e58d510_o_d.jpg',
			'http://farm1.static.flickr.com/122/304720836_030882248d_o_d.jpg',
			'http://farm1.static.flickr.com/95/275089684_894721da44_o_d.jpg',
			'http://farm1.static.flickr.com/74/203856133_17734c9046_o_d.jpg',
			'http://farm1.static.flickr.com/69/197975260_6bbd9d188f_o_d.jpg',
			'http://farm1.static.flickr.com/55/143523603_633cf99f77_o_d.jpg'			
		];
		
		public static const ERROR_IMG:String = 'http://www.matthijskamstra.nl/noimagefolder/noimage.png';
		
		public static const TITLE:String = "Lorem Ipsum";
		
		public static const SENTENCE:String = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.";
		
		public static const TEXT:String = SENTENCE + " Curabitur hendrerit eros vel est. Vestibulum non nunc. " +
			"Proin et dolor id dolor pellentesque facilisis. " +
			"Nulla a nulla. Vestibulum gravida odio nec lacus. Praesent tellus nibh, imperdiet in, volutpat vitae, " +
			"facilisis sit amet, justo. Integer neque. Fusce dolor. Nunc ligula. Aliquam erat volutpat. " +
			"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas egestas diam. Cras lobortis nibh " +
			"in est. Sed auctor sapien sagittis tellus. Donec sapien ligula, euismod sollicitudin, aliquam vitae, " +
			"fringilla ut, elit.\n" +
			"\n" +
			"Aenean volutpat risus a nibh. Praesent feugiat volutpat eros. Nunc vitae neque " +
			"vel felis porta pulvinar. Integer tortor tortor, mattis id, volutpat in, consectetuer a, ante. " +
			"Praesent suscipit elit nec arcu. Sed blandit cursus neque. Curabitur a mi. Pellentesque tellus dui, " +
			"ultricies nec, tristique sit amet, interdum eget, velit. Suspendisse imperdiet. Pellentesque habitant " +
			"morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum accumsan dui sit " +
			"amet quam. Cras ullamcorper faucibus odio. Suspendisse consectetuer. Nulla facilisi. Duis est quam, " +
			"pulvinar nec, lacinia id, cursus in, dui.\n" +
			"\n" +
			"Suspendisse id neque pharetra augue ultricies semper. " +
			"Morbi fringilla dictum sem. Donec suscipit felis ac magna. Donec a felis. Nulla facilisi. Sed vitae " +
			"augue id enim luctus auctor. Maecenas venenatis suscipit eros. Nunc suscipit nulla in erat. Class aptent " +
			"taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Quisque ultrices, tellus vel " +
			"ultrices fermentum, sem lorem egestas metus, ut lacinia urna lorem nec mi.\n" +
			"\n" +
			"Maecenas nec ante a velit " +
			"suscipit ultrices. Vestibulum sed tortor fermentum mauris accumsan rutrum. Cras in risus. In hac habitasse " +
			"platea dictumst. Nunc massa. Duis gravida, enim at feugiat iaculis, nisl metus pharetra enim, ut posuere " +
			"arcu ante vitae enim. Donec pulvinar justo sit amet sem. In elementum sodales nisl. Duis eget pede eu magna " +
			"porta feugiat. Sed quis neque. Etiam nec nunc. Nulla convallis nibh vel ante. Praesent viverra. Integer " +
			"elementum arcu vitae leo. Nullam quis sapien. Ut vel ipsum a nulla sagittis ultricies. Phasellus bibendum, " +
			"mauris id ultricies lobortis, nunc nisi fermentum nisi, vulputate pulvinar arcu ipsum eget eros. " +
			"Vivamus faucibus.\n" +
			"\n" +
			"Quisque vel nisl. Curabitur adipiscing risus quis sem. Proin tortor neque, vestibulum et, sagittis " +
			"lacinia, volutpat eu, eros. Maecenas scelerisque sem in erat. Curabitur vehicula, elit quis tristique " +
			"venenatis, quam tortor interdum nisi, eget rhoncus arcu ipsum et enim. Lorem ipsum dolor sit amet, " +
			"consectetuer adipiscing elit. Mauris metus. Praesent egestas condimentum nisi. Mauris ullamcorper " +
			"pede at turpis. Integer pellentesque ultrices augue. Vivamus facilisis lacus nec neque. Vivamus " +
			"cursus ligula. Pellentesque commodo. Curabitur et purus.";
	
		
	}
}
