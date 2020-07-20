		var clientmap;
		// var sessione = '';
		var logged=false;
		var current_delivery='';
		// var cid=0;
		// var enable_order=0;
		// var table=-1;
		// var tableDescription='';
		

		//lazy load
		if(lazy_required==1){
			$(function() {
        	  $("img").lazyload({
        	  		//threshold : 20, //load image 200px before it is visible
        	  		//skip_invisible : false
        	      effect : "fadeIn" //without, better performance on old device
        	  });
      		});
      	}
		
		//************//
		//  ISCROLL   //
		//************//
		/* set wrapper id div
      	var myScroll;
		function loaded() {
			myScroll = new iScroll('wrapper');
		}

		document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
		
		document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);
		*/

		function showMessage(message){
			$("<div class='ui-loader ui-overlay-shadow ui-body-b ui-corner-all'><h3>"+message+"</h3></div>").css({ "display": "block", "position": "fixed", "opacity": 0.92, "left": 0, "top": "60%", "width": "100%", "text-align": "center" }).appendTo( $.mobile.pageContainer ).delay( 3500 ).fadeOut( 2000, function(){
					$(this).remove();
			});
		}
		function call(code, d, d_time){
			$.mobile.loading("show");
			if (code==4) {
				$.post('lib.php', {operation: "insertCall", table: table, cid: cid, type: code, session: sessione, d: d, dTime: d_time}, onInsertCallSuccess);
				//location.reload();
				$.post('regenerate_session_id.php', loadSession);
				//$('#messageCloseButton').click();
				
				$('#closeButtonCart').click();
				//$.mobile.changePage('#message',{transition: 'pop', role: 'dialog'});
				

			}
			else{
				$.post('lib.php', {operation: "insertCall", table: table, cid: cid, type: code, d: d, dTime: d_time}, onInsertCallSuccess);
				//$.mobile.changePage('#message',{transition: 'pop', role: 'dialog'});
			}

		}
		function onInsertCallSuccess(response){
			$.mobile.loading("hide");
			if(response.returnCode==0){
				temp_msg=((selected_lang=='it')?'Ordine registrato con successo':'Order successfully registered');
				showMessage(temp_msg);
			}
			else if(response.returnCode==1){//table not selected
				temp_msg=((selected_lang=='it')?'La tabella non è ancora stata selezionata!':'Table has not selected yet!');
				showMessage(temp_msg);
				setTimeout(function(){ location.href="tableselect.php"; }, 3000);
			}
			else showMessage('errore generico, si prega di riprovare');
			if(choose_delivery_method==1){
				//alert('sti cazzi');
				//$('#purchase').popup('close');
				$('#closeSummary').click();
			}
		}

		function loadSession(response){
			if(response.response == 'S_OK'){
				sessione=''+response.sessione;
				cartUpdate();

			}
			else{
				alert("errore nell'applicazione si prega di riavviare");
			}
		}	

		function cartUpdate(){
			$.mobile.loading("show");
			$.post('lib.php', {operation: "getCart", session: sessione, cid: cid}, loadCart);
		}

		function loadCart(response){
				var i = 0;
				var cartElement = $(".cart3");
				cartElement.html('<li data-role=\"list-divider\" >Carrello '+tableDescription+' </li>');
				if(response.records != null){
					$('.orderButton').removeClass('ui-disabled');
					var tot=0;
					for(; i< response.records.length; i++){
						tot+=(parseInt(response.records[i].record.price)*parseInt(response.records[i].record.number));
						//cartElement.append('<li><a href=\"detail.php?oid='+response.records[i].record.oid+'&session='+sessione+'\"><img src=\"'+response.records[i].record.image_path_low+'\" /><h2>'+response.records[i].record.name+'</h2><p>'+response.records[i].record.description+'</p><p>€'+response.records[i].record.price+'</p><span id=\"span'+response.records[i].record.cart_row_id+'\" class=\"ui-li-count\">'+response.records[i].record.number+'</span></a></a><a id=\"delete\" data-icon=\"delete\" data-transition=\"none\" data-rel=\"dialog\" onclick=\"deleteOrderRow('+response.records[i].record.cart_row_id+')\" title=\"Elimina\" data-theme=\"e\" style=\"border-top-width: 0px; border-bottom-width: 0px;\"></a><span class=\"row_buttons\"><a onclick=\"pushNumber('+response.records[i].record.cart_row_id+')\" data-role=\"button\" data-icon=\"plus\" data-iconpos=\"notext\">Aggiungi</a><a onclick=\"pullNumber('+response.records[i].record.cart_row_id+')\" data-role=\"button\" data-icon=\"minus\" data-iconpos=\"notext\">Togli</a></span></li>');
						cartElement.append('<li><a onclick="return getDetailContentCart('+response.records[i].record.oid+', \''+sessione+'\')" href=\"#\"><img src=\"'+response.records[i].record.image_path_low+'\" /><h2>'+response.records[i].record.name+'</h2><p>'+response.records[i].record.description+'</p><p>€'+response.records[i].record.pricedes+'</p><span id=\"span'+response.records[i].record.cart_row_id+'\" class=\"ui-li-count\">'+response.records[i].record.number+'</span></a></a><a id=\"delete\" data-icon=\"delete\" data-transition=\"none\" data-rel=\"dialog\" onclick=\"deleteOrderRow('+response.records[i].record.cart_row_id+')\" title=\"Elimina\" data-theme=\"e\" ></a><span class=\"row_buttons\"><a onclick=\"pushNumber('+response.records[i].record.cart_row_id+')\" data-role=\"button\" data-icon=\"plus\" data-iconpos=\"notext\">Aggiungi</a><a onclick=\"pullNumber('+response.records[i].record.cart_row_id+')\" data-role=\"button\" data-icon=\"minus\" data-iconpos=\"notext\">Togli</a></span></li>');
					
					}
					//alert(tot);
					var totdes=tot+'';
					totdes=totdes.slice(0,totdes.length - 2) + "," + totdes.slice(totdes.length - 2);
					$('.total').html('Totale: '+totdes+'€');

				}
				else{
					$('.orderButton').addClass('ui-disabled');
					//cartElement.append('<li>Il carrello è vuoto</li>');
					cartElement.append('<li>Lista vuota</li>');
					$('.total').html('Totale: 0€');
				}
				if(user_login_required==1 && logged==false){
					$('.orderButton').addClass('ui-disabled');
				}
				$(".divcart").trigger('create');
				cartElement.listview('refresh');
				$.mobile.loading("hide");

		}
		function ordersUpdate(id){
			$.mobile.loading("show");
			var ordersid='orders'+id;
			$.post('ordersContent.php', {cid: cid}, onOrdersUpdate(ordersid));
		}
		function onOrdersUpdate(ordersid) {
			return function(response) { 

				$("#"+ordersid).html(response);
				$("#"+ordersid).trigger('create');	
			}
			$.mobile.loading("hide");
		}

		function getDetailContent(id, s){
			$.mobile.loading("show");
			//$("#detaildiv").html('<div class= "rounded shadow light content inlineleft detail_image_2" id="detail_image_3"><img style="width:100%; height:auto;" src="image/load.gif" id="image_3" /></div>');
			//$("#detaildiv").trigger('create');	
			console.log("cid: "+cid);
			$.post('detailContent.php', {id: id, s: s, cid: cid, eo: enable_order}, onGetDetailContent);

		}
		function getDetailContentCart(id, session){
			$.mobile.loading("show");
			//$("#detaildiv").html('<div class= "rounded shadow light content inlineleft detail_image_2" id="detail_image_3"><img style="width:100%; height:auto;" src="image/load.gif" id="image_3" /></div>');
			//$("#detaildiv").trigger('create');	
			$.post('detailContent.php', {oid: id, session: session}, onGetDetailContent);
		}
		function onGetDetailContent(response) {
			//alert(response);
			$("#detaildiv").html(response);
			$("#detaildiv").trigger('create');
			$.mobile.changePage('#detail');
			$.mobile.loading("hide");
			updateImage();
		}
		function getOrderSummaryContent(){
			$.mobile.loading("show");
			//$("#detaildiv").html('<div class= "rounded shadow light content inlineleft detail_image_2" id="detail_image_3"><img style="width:100%; height:auto;" src="image/load.gif" id="image_3" /></div>');
			//$("#detaildiv").trigger('create');	
			$.post('orderSummaryContent.php', onGetOrderSummaryContent);
		}
		function onGetOrderSummaryContent(response){
			//alert(response);
			$("#ordersummarydiv").html(response);
			$("#ordersummarydiv").trigger('create');
			$.mobile.changePage('#ordersummary');
			$.mobile.loading("hide");
			//updateImage();
		}
		function addDetail(rowId, session){
			$.mobile.loading("show");
			var number = $('#number option:selected').val();
			var note = $('#pNote').val();
			if(note===undefined) note='';
			if(number == '') number = 1;
			$.post('lib.php', {operation: "insertOrderRow", rowId: rowId, cid: cid, number: number, session: session, table: table, note: note}, onAddDetail);
					
		}
		function onAddDetail(response) {
			if(response.returnCode==0){
				$('#closeDetail').click();
			}
			else{
				alert('errore generico, si prega di riprovare')
			}
			$.mobile.loading("hide");
		}
		function updateDetail(rowId){
			$.mobile.loading("show");
			var number = $('#number').val();
			var note = $('#pNote').val();
			if(note===undefined) note='';
			if(number == '') number = 1;
			$.post('lib.php', {operation: "updateOrderRow", rowOrderId: rowId, number: number, note: note}, onUpdateDetail);
					
		}
		function onUpdateDetail(response) {
			cartUpdate();
			$('#closeDetail').click();
			$.mobile.loading("hide");
		}
		
		function clearDetail(){
			$("#detaildiv").html('<div id="name2"><h3 class="no_margin">Loading...</h3></div><a data-role="button">Loading...</a><input name="number" id="number" value="1"  data-inline="true" /><div class= "rounded shadow light content inlineleft detail_image_2" id="detail_image_3"><img style="width:100%; height:auto;" src="image/load.gif" id="image_3" />');
			$("#detaildiv").trigger('create');	
		}
		
		function pushNumber(cartRowId){
			$.mobile.loading("show");
			$.post('lib.php', {operation: "pushNumber", cartRowId: cartRowId}, cartUpdate);
		}
		function pullNumber(cartRowId){
			$.mobile.loading("show");
			$.post('lib.php', {operation: "pullNumber", cartRowId: cartRowId}, cartUpdate);
		}
		function deleteOrderRow(cartRowId){
			$.mobile.loading("show");
			$.post('lib.php', {operation: "deleteOrderRow", cartRowId: cartRowId}, cartUpdate);
		}

		function isAndroid(){
			return true;
			//if (navigator.userAgent.toLowerCase().indexOf("android") != -1) return true;
			//return false;
		}
		function login(){
			var user=$('#usernameL').val();
			var psw=$('#passwordL').val();
			if(user=='' || psw == ''){
				//mostra messaggio di dati obbligatori
				alert('inserire dati obbligatori');
			}
			else{
				$.mobile.loading("show");
				$.post('lib.php', {operation: "login", username: user, password: psw}, onLoginSuccess);
			}
			
		}
		function onLoginSuccess(response){
			$.mobile.loading("hide");
			if(response.returnCode=='0' && response.records != null){
				
				$('#closeButtonLogin').click();
				$('.usernameText').html(response.records[0].record.username);
				$(".loginButton").css("display", "none");
				$(".logoutButton").css("display", "block");
				$(".profileButton").css("display", "block");

				$('.userimage').attr("src", response.records[0].record.image_path_low);

				if(response.records[0].record.activated == 1){
					logged=true;
					
					$('.activateButton').css("display", "none");
					$('.orderButton').removeClass('ui-disabled');
					location.href="./?cid="+response.records[0].record.client_id;
				}
				else{
					logged=false;
					$('.activateButton').css("display", "block");
					$('.orderButton').addClass('ui-disabled');
					
				}
				showMessage('Login effettuato correttamente');
			}
			else{
				logged=false;
				$('.orderButton').addClass('ui-disabled');
				showMessage('Errore di login, si prega di riprovare');
			}
			//cartUpdate(); non riordo perchè ho messo questo ma da un errore
		}		
		function onIsLoginSuccess(response){

			if(response.returnCode=='0' && response.records != null){
				
				$('.usernameText').html(response.records[0].record.username);
				$('.loginButton').css("display", "none");
				$('.logoutButton').css("display", "block");
				$(".profileButton").css("display", "block");
				$('.userimage').attr("src", response.records[0].record.image_path_low);

				if(response.records[0].record.activated == 1){
					logged=true;
					$('.activateButton').css("display", "none");
					$('.orderButton').removeClass('ui-disabled');
				}
				else{
					logged=false;
					$('.activateButton').css("display", "block");
					$('.orderButton').addClass('ui-disabled');
				}
			}
			else{
				logged=false;
				$('.orderButton').addClass('ui-disabled');
				$('.loginButton').css("display", "block");
				$('.logoutButton').css("display", "none");
				$('.profileButton').css("display", "none");
				$('.activateButton').css("display", "none");
			}
			//cartUpdate();// non riordo perchè ho messo questo ma da un errore
		}		
		function logout(){
			$.mobile.loading("show");
			$.post('lib.php', {operation: "logout"}, onlogoutSuccess);
			location.href="./login.php";
			
		}
		function onlogoutSuccess(response){
			$.mobile.loading("hide");
			if(response.returnCode=='0'){
				logged=false;
				$('.orderButton').addClass('ui-disabled');
				$('.usernameText').html('Utente');
				$('.loginButton').css("display", "block");
				$('.logoutButton').css("display", "none");
				$('.profileButton').css("display", "none");
				$('.activateButton').css("display", "none");
				$('.userimage').attr("src", "image/user.png");
				showMessage('Logout effettuato con successo');
			}
			else{
				logged=true;
				$('.orderButton').removeClass('ui-disabled');
				showMessage('Errore, si prega di riprovare');
			}
		}
		function forgetPassword(){
			$.mobile.loading("show");
			var user=$('#usernameF').val();
			if(user==''){
				//mostra messaggio di dati obbligatori
				alert('inserire un indirizzo mail corretto');
			}
			else{
				$.mobile.loading("show");
				$.post('lib.php', {operation: "forgetPassword", username: user}, onForgetPasswordSuccess);
			}
		}
		function onForgetPasswordSuccess(response){
			$.mobile.loading("hide");
			if(response.returnCode=='0'){
				showMessage("Una mail con una nuova password è stata inviata all'indirizzo indicato");
				$('#closeButtonLogin').click();
			}
			else if(response.returnCode=='1'){
				showMessage("l'indirizzo email inserito non è presente negli archivi, inserire l'indirizzo di registrazione");
			}
			else if(response.returnCode=='3'){
				showMessage("Errore nell'invio della mail, si prega di riprovare");
			}
			else{
				showMessage('Errore generico, si prega di riprovare');
			}
		}
		function changePassword(){
			var pswold=$('#passwordP').val();
			var pswnew=$('#passwordPN1').val();
			var pswnew2=$('#passwordPN2').val();
			if(pswnew != pswnew2){
				alert('le password non corrispondono');
			}
			else{
				if(pswold=='' || pswnew == '' || pswnew2 == ''){
				//mostra messaggio di dati obbligatori
					alert('inserire dati obbligatori');
				}
				else{
					$.mobile.loading("show");
					$.post('lib.php', {operation: "changePassword", passwordOld: pswold, passwordNew: pswnew}, onChangePasswordSuccess);
				}
			}
		}
		function onChangePasswordSuccess(response){
			$.mobile.loading("hide");
			if(response.returnCode=='0'){
				showMessage('cambio password avvenuto con successo, è stata inviata un mail di riepilogo');
				$('#closeButtonUserProfile').click(); 
			}
			else if(response.returnCode=='100'){
				showMessage("Sessione scaduta, si prega di rieffettuare il login");
			}
			else if(response.returnCode=='2'){
				showMessage("Password attuale inserita non corretta");
			}
			else if(response.returnCode=='3'){
				showMessage("Errore nell'invio della mail");
			}
			else{
				showMessage('Errore, si prega di riprovare');
			}
		}

		function changeNumber(){
			var cellpre=$('#cellPreP').val();
			var cell=$('#cellP').val();
			
			if(cellpre=='' || cell == ''){
			//mostra messaggio di dati obbligatori
				alert('inserire dati obbligatori');
			}
			else{
				$.mobile.loading("show");
				$.post('lib.php', {operation: "changeNumber", cellpre: cellpre, cell: cell}, onChangeNumberSuccess);
			}
		}
		function onChangeNumberSuccess(response){
			$.mobile.loading("hide");
			if(response.returnCode=='0'){
				logged=false;
				$('.activateButton').css("display", "block");
				$('.orderButton').addClass('ui-disabled');
				showMessage('Numero aggiornato con successo, è stato inviato un SMS con codice di conferma');
				$('#closeButtonUserProfile').click(); 
			}
			else if(response.returnCode=='100'){
				showMessage("Sessione scaduta, si prega di rieffettuare il login");
			}
			else if(response.returnCode=='1'){
				showMessage("Numero di telefono già in uso, inserire un'altro numero e riprovare");
			}
			else if(response.returnCode=='2'){
				logged=false;
				$('.activateButton').css("display", "block");
				$('.orderButton').addClass('ui-disabled');
				showMessage("Errore nell'invio dell'SMS");
			}
			else{
				showMessage('Errore, si prega di riprovare');
			}
		}

		function register(){
			var user=$('#usernameR').val();
			var psw=$('#passwordR').val();
			var psw2=$('#passwordR2').val();
			var pre=$('#cellPreR').val();
			var num=$('#cellR').val();
			var email='';

			if(psw != psw2){
				alert('le password non corrispondono');
			}
			else{
				if(user=='' || psw == '' || pre == '' || num == ''){
				//mostra messaggio di dati obbligatori
					alert('inserire dati obbligatori');
				}
				else{
					$.mobile.loading("show");
					$.post('lib.php', {operation: "register", username: user, password: psw, prefix: pre, number: num, email: email, cid: cid}, onRegisterSuccess);
				}
			}
			
		}
		function onRegisterSuccess(response){
			$.mobile.loading("hide");
			if(response.returnCode=='0'){
				//showMessage('Registrazione avvenuta correttamente, è stata inviato un SMS con codice conferma');
				//$('#closeButtonLogin').click(); // lo fa già onLoginSuccess
				var user=$('#usernameR').val();
				var psw=$('#passwordR').val();
				$.post('lib.php', {operation: "login", username: user, password: psw}, onLoginSuccess);
			}
			else if(response.returnCode=='1'){
				showMessage("Numero di telefono già in uso, inserire un'altro numero e riprovare");
			}
			else if(response.returnCode=='2'){
				showMessage("Errore nell'invio dell'SMS");
			}
			else if(response.returnCode=='3'){
				showMessage("Errore nell'invio della mail");
			}
			else{
				showMessage('Errore, si prega di riprovare');
			}
			
		}
		function activateAccount(){
			$.mobile.loading("show");
			var code=$('#codeA').val();
			$.post('lib.php', {operation: "activateAccount", code: code}, onActivateAccountSuccess);
		}
		function onActivateAccountSuccess(response){
			$.mobile.loading("hide");
			if(response.returnCode=='0'){
				logged=true;
				showMessage("Account attivato con successo");
				$('#closeButtonActivate').click();
				$('.loginButton').css("display", "none");
				$('.logoutButton').css("display", "block");
				$('.profileButton').css("display", "block");
				$('.activateButton').css("display", "none");
				$('.orderButton').removeClass('ui-disabled');
			}
			else if(response.returnCode=='1'){
				showMessage("codice di attivazione errato");
				logged=false;
			}
			else if(response.returnCode=='100'){
				showMessage("Sessione scaduta, rifare il login");
				logged=false;
			}
		}

		function insertUserAddress(){

			$.mobile.loading("show");
			var aName=$('#aName').val();
			var aLastName=$('#aLastName').val();
			var aAddress=$('#aAddress').val();
			var aNumber=$('#aNumber').val();
			var aDoorBell=$('#aDoorBell').val();
			var aApartmentNumber=$('#aApartmentNumber').val();
			var aFloor=$('#aFloor').val();
			var aZipCode=$('#aZipCode').val();
			var aRegioni=$('#aRegioni').val();
			var aProvince=$('#aProvince').val();
			var aComuni=$('#aComuni').val();


			if(aName=='' || aLastName == '' || aAddress == '' || aNumber == '' || aDoorBell == '' || aZipCode == '' || aRegioni == '' || aProvince == '' || aComuni == ''){
				//mostra messaggio di dati obbligatori
				alert('inserire dati obbligatori');
			}
			else{
				$.mobile.loading("show");
				$.post('lib.php', {operation: "insertUserAddress", aName: aName, aLastName: aLastName, aAddress: aAddress, aNumber: aNumber, aDoorBell: aDoorBell, aApartmentNumber: aApartmentNumber, aFloor: aFloor, aZipCode: aZipCode, aRegioni: aRegioni, aProvince: aProvince, aComuni: aComuni}, onInsertUserAddress);
			}
		}
		function onInsertUserAddress(response){
			$.mobile.loading("hide");
			if(response.returnCode=='0'){
				showMessage("indirizzo inserito correttamente");
			}
			else if(response.returnCode=='1'){
				showMessage("codice di attivazione errato");
			}
			else if(response.returnCode=='100'){
				showMessage("Sessione scaduta, rifare il login");
			}
			else{
				showMessage("Errore si prega di riprovare");
			}
		}

		function hideAddressBar(){
  			if(document.documentElement.scrollHeight < window.outerHeight / window.devicePixelRatio) {
    			document.documentElement.style.height = (window.outerHeight / window.devicePixelRatio) + 'px';
    			setTimeout(window.scrollTo(1,1),10);
  			}
		}

		$(document).ready(function() {
			if(!isAndroid()){
				$(document).on("swipeleft", "div.ui-page", function(event){
					var nextpage = $(this).next('div[data-role="page"]');
					if (nextpage.length > 0) {
						//$.mobile.changePage(nextpage, "slide", false, true);
						if (isAndroid()) {
							$.mobile.changePage(nextpage, {transition: "none", reverse: false}, true, true);
						}
						else{
							$.mobile.changePage(nextpage, {transition: "slide", reverse: false}, true, true);
						}
						//alert ($.mobile.activePage.find("#divcart").attr("id")=="divcart");
						if ($.mobile.activePage.find("#divcart").attr("id")=="divcart") cartUpdate();
						event.stopImmediatePropagation();
					}
				});
				$(document).on("swiperight", "div.ui-page", function(event){
					var prevpage = $(this).prev('div[data-role="page"]');
					if (prevpage.length > 0) {
						if (isAndroid()) {
							$.mobile.changePage(prevpage, {transition: "none", reverse: true}, true, true);
						}
						else{
							$.mobile.changePage(prevpage, {transition: "slide", reverse: true}, true, true);
						}
						if ($.mobile.activePage.find("#divcart").attr("id")=="divcart") cartUpdate();
						event.stopImmediatePropagation()
					}
				});
				
			}
			/*
			$("#aRegioni").change(function () {
   				var $this = $(this),
        		val   = $this.val();
        		alert(val);
    			
			});
			/*
 			//cartUpdate();
 			
 			//$("#table").html("<h3>Tavolo "" </h3>");
 			
 			/*
			Prevent native scroll
			*/
			//da aggiungere iscroll per le liste effettivamente ti blocca la barra sole che ri vede quando cambia pagina
			/*
			document.body.addEventListener('touchmove', function(e) {
				if (window.pageYOffset==1){
					e.preventDefault();
				}
			}, false);
			*/

			/*
			Display a warning when user is leaving the page
			*/	
			/* non va bene per i passaggi a pagine non ajax
			window.onbeforeunload = function() {		
				return "Vuoi veramente uscire?";	
			}
			*/
 			if (isAndroid())
			{
				$.mobile.defaultPageTransition = "none"
    			$.mobile.defaultDialogTransition = 'none';
    			$.mobile.useFastClick = true; 
    			//$.mobile.touchOverflowEnabled = true; //deprecated
   				//$("a").attr("data-transition", "none");
   				//$("li").attr("data-transition", "none");
			}
			//cartUpdate();
			if(user_login_required==1){
				$.post('lib.php', {operation: "isLogin"}, onIsLoginSuccess);
			}
			/*
			window.addEventListener("load",function() {
				// Set a timeout...
				setTimeout(function(){
					// Hide the address bar!
					window.scrollTo(0, 1);
				}, 0);
			});
			*/
			/* not wok
        	clientmap = new GMaps({
        		div: '#clientmap',
        		lat: -12.043333,
        		lng: -77.028333
      		});
*/
			$(".rating").jRating({
	  			isDisabled : true
			});
			window.addEventListener("load",function(){hideAddressBar();});
			window.addEventListener("orientationchange",function(){hideAddressBar();});

			/*adding shadow only when scroll down , remove class from html navbar element
 			$(window).scroll(function(){
  				var y = $(window).scrollTop();
  				if( y > 0 ){
      				$(".navbar").addClass('shadow');
  				} else {
      				$(".navbar").removeClass('shadow');
  				}
 			});
			*/

			/*hide and show a navbar on scroll top or scroll down
			var previousScroll = 0,
    		headerOrgOffset = $('#navbar').height();

			//$('#header-wrap').height($('#header').height());

			$(window).scroll(function () {
    			var currentScroll = $(this).scrollTop();
    			if (currentScroll > headerOrgOffset) {
       				if (currentScroll > previousScroll) {
            			$('.navbar').hide();
        			} else {
            			$('.navbar').show();
        			}
    			} 
   			 	previousScroll = currentScroll;
			});

			*/
      		
		});