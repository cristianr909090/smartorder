function lang_changed(e,page_source){
	if(page_source=='front')$.post('lib.php', {operation: "langChanged", lang: e.value}, reLoad);
	else $.post('../lib.php', {operation: "langChanged", lang: e.value}, reLoad);
}
function reLoad(){
	location.reload();
}

function edit_row(e, id, name, visibility, position, tOrder, type, data){
	// alert(id+"--"+name+"--"+visibility+"--"+position+"--"+tOrder+"--"+type+"--"+data);
	e.parentElement.innerHTML='<input type="hidden" id="tab_id" value="'+id+'">'+
								'<div class="tab_row_col_1"><input type="text" id="tab_name" value="'+name+'"></div>'+
								'<div class="tab_row_col_2"><input type="checkbox" id="tab_visibility" '+((visibility==1)?"checked":"")+'></div>'+
								'<div class="tab_row_col_3"><select name="tab_position" id="tab_position" form="tabForm"><option value="0" '+((position==0)?"selected":"")+'>'+(selected_lang=="en"?'Main Menu':'Menu principale')+'</option><option value="1" '+((position==1)?"selected":"")+'>'+(selected_lang=="en"?'Right Menu':'Menu di destra')+'</option></select></div>'+
								'<div class="tab_row_col_4"><input type="number" id="tab_tOrder" value="'+tOrder+'"></div>'+
								'<div class="tab_row_col_5">'+make_tab_type(type)+'</div>'+
								'<div class="tab_row_col_6"><input type="text" id="tab_data" value="'+data+'"></div>'+
								'<div class="tab_row_col_7" style="font-size: 20px; margin-left: 20px;"><button type="button" style="border:none; background: transparent" onclick="update_tab(this)"><i class="far fa-save"></i></button></div>';
}
function add_row(e){
	e.parentElement.innerHTML='<div class="tab_row_col_1"><input type="text" id="tab_name" value="'+(selected_lang=="en"?'New Menu':'Nuova sezione')+'"></div>'+
								'<div class="tab_row_col_2"><input type="checkbox" id="tab_visibility" checked></div>'+
								'<div class="tab_row_col_3"><select name="tab_position" id="tab_position" form="tabForm"><option value="0" checked>'+(selected_lang=="en"?'Main Menu':'Menu principale')+'</option><option value="1">'+(selected_lang=="en"?'Right Menu':'Menu di destra')+'</option></select></div>'+
								'<div class="tab_row_col_4"><input type="number" id="tab_tOrder" value="'+(parseInt(document.getElementById("hidden_max_sequence").innerHTML)+1)+'"></div>'+
								'<div class="tab_row_col_5">'+make_tab_type(0)+'</div>'+
								'<div class="tab_row_col_6"><input type="text" id="tab_data" value=""></div>'+
								'<div class="tab_row_col_7" style="font-size: 20px; margin-left: 20px;"><button type="button" style="border:none; background: transparent" onclick="add_tab(this)"><i class="far fa-save"></i></button></div>';
}
function make_tab_type(type){
	//type_array is for type select
	var type_array=["Pulsante (chiamata cameriere)",
					"Tab Semplice (Lista piana)",
					"Eventi",
					"Tab Carrello/WishList",
					"Tab Gerarchico (Lista ad albero)",
					"Ordini effettuati",
					"Link a sito esterno (solo menu a destra)",
					"IFrame link a sito esterno",
					"About (info servizismart)"];
	var option_type_list='';
	for(i=0;i<type_array.length;i++)option_type_list+="<option value='"+i+"' "+(i==type?"selected":"")+">"+type_array[i]+"</option>";
	return "<select id='tab_type' class='tab_type' value='"+type+"'>"+option_type_list+"</select>";
}
function delete_row(tab_id){
	$.post('../lib.php', {operation: "deleteTabEdit", 
							tab_id: tab_id}, after_update_tab);
}
function update_tab(e){
	var temp_tab_visibility=(document.getElementById("tab_visibility").checked==true)?1:0;
	var temp_e=document.getElementById("tab_position");
	var temp_tab_position=temp_e.options[temp_e.selectedIndex].value;
	console.log(document.getElementById("tab_type").value);
	$.post('../lib.php', {operation: "updateTabEdit", 
							tab_id: document.getElementById("tab_id").value,
							tab_name: document.getElementById("tab_name").value,
							tab_visibility: temp_tab_visibility,
							tab_position: temp_tab_position,
							tab_tOrder: document.getElementById("tab_tOrder").value,
							tab_type: document.getElementById("tab_type").value,
							tab_data: document.getElementById("tab_data").value
							}, after_update_tab);
}
function add_tab(e){
	var temp_tab_visibility=(document.getElementById("tab_visibility").checked==true)?1:0;
	var temp_e=document.getElementById("tab_position");
	var temp_tab_position=temp_e.options[temp_e.selectedIndex].value;
	console.log(temp_tab_position);
	$.post('../lib.php', {operation: "addTabEdit", 
							tab_cid: document.getElementById('hidden_cid').innerHTML,
							tab_name: document.getElementById("tab_name").value,
							tab_visibility: temp_tab_visibility,
							tab_position: temp_tab_position,
							tab_tOrder: document.getElementById("tab_tOrder").value,
							tab_type: document.getElementById("tab_type").value,
							tab_data: document.getElementById("tab_data").value
							}, after_update_tab);
}
function after_update_tab(response){
	if(response.returnCode==0){
		alert("Successfully updated the tab");
		location.reload();
	}else alert("Some error occured in updating tab");
}

//ajax call for show order
function order_show(type){
	if(document.getElementById('hidden_cid') !=null){
		$.post('../lib.php', 
				{
					operation: "getOrderHistory", 
					cid: document.getElementById('hidden_cid').innerHTML,
					type: type
				}, 
				order_history_update);
		for(i=1; i<4; i++){
			if(i!=type)$("#requests_tr_"+i).removeClass("ccc_background");
			$("#requests_tr_"+type).addClass("ccc_background");
		}
		console.log(type);
	}
}

function order_history_update(response){
	console.log(response);
	var temp_order_history_string='<table>'+
									'<thead>'+
										'<tr>'+
											'<td>'+(selected_lang=="en"?'Table':'Tavolo')+'</td>'+
											'<td>'+(selected_lang=="en"?'Time':'Data Ora')+'</td>'+
											'<td>Order Id</td>'+
										'</tr>'+
									'</thead>'+
									'<tbody>';
	if(response.records != null){
		for(i=0; i< response.records.length; i++){

			temp_order_history_string+='<tr data-href="orderdetails.php?id='+response.records[i].record.order_id+'" target="_parent"><td>'+response.records[i].record.r_table+'</td><td>'+response.records[i].record.r_time+'</td><td>'+response.records[i].record.order_id+'</td></tr>';
					
		}
		$('.order-history-container').html(temp_order_history_string+'</tbody></table>');

	}
	else{
		$('.order-history-container').html(selected_lang=="en"?'No record to show!':'Nessun record da mostrare!');
	}
}

//disable/enable product
function disableProduct(product_id){
	$.post('../lib.php', 
			{
				operation: "disableOrEnableProduct", 
				product_id: product_id,
				type: 'disable'
			}, 
			after_dis_enable_product('disable'));
}
function enableProduct(product_id){
	$.post('../lib.php', 
			{
				operation: "disableOrEnableProduct", 
				product_id: product_id,
				type: 'enable'
			}, 
			after_dis_enable_product('enable'));
}
function deleteProduct(product_id){
	areYouSure("Eliminare", "Sei sicuro di voler eliminare il prodotto?", "Conferma", function() {
		// user has confirmed, do stuff
		$.post('../lib.php', 
			{
				operation: "disableOrEnableProduct", 
				product_id: product_id,
				type: 'delete'
			}, 
			after_dis_enable_product('delete'));
	});
	
}
function after_dis_enable_product(type) {
	return function(response) { 
		if(response.returnCode==0){
			alert("Successfully "+type+"d product!");
			location.reload();
		}else alert("Error occured while "+type+"ling product!");
	}
}
function areYouSure(text1, text2, button, callback) {
	$("#sure .sure-1").text(text1);
	$("#sure .sure-2").text(text2);
	$("#sure .sure-do").text(button).on("click.sure", function() {
	  callback();
	  $(this).off("click.sure");
	});
	$.mobile.changePage("#sure");
}

function deleteCategory(categoryId){
	$.post('../lib.php', 
			{
				operation: "checkCategoryDanger", 
				categoryId: categoryId
			}, 
			function(response){
					areYouSure("Cancella categoria", response.returnCode==0?"Sei sicuro di voler eliminare la categoria?":"Esistono prodotti("+response.returnCode+") associati alla categoria che stai cancellando. I prodotti rimarranno nel catalogo e potranno essere associati ad altre categorie. Confermi?", "Conferma", function() {
						// user has confirmed, do stuff
						$.post('../lib.php', 
											{
												operation: "deleteCategory", 
												categoryId: categoryId
											}, 
											after_delete_category
						);
					});
			}
	);
	
	
}
function after_delete_category(response){
	if(response.returnCode==0){
		alert("Successfully deleted the category");
		location.reload();
	}else alert("Some error occured while deleting the category");
}

window.onload = function(e){ 
	//by default show the order of today
	order_show(1);
}







