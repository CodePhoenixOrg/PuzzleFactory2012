var PZ_CUR_ROW_COLOR="lightgrey";
var PZ_CUR_TEXT_COLOR="black";
var PZ_DEF_HL_BACK_COLOR="grey";
var PZ_DEF_HL_TEXT_COLOR="white";

function pz_shadow(thisName) {

	table=eval(document.getElementById(thisName));
	shadow=eval(document.getElementById(thisName+"_shadow"));
	shadow_width=eval(document.getElementById(thisName+"_sw"));
	shadow_height=eval(document.getElementById(thisName+"_sh"));

	shadow.style.width=table.offsetWidth+11+"px";
	shadow_width.style.width=table.offsetWidth-8+"px";
	shadow_height.style.height=table.offsetHeight-8+"px";

}

function setRowColor(thisRow, hlBackColor, hlTextColor) {
	id=thisRow.id;
	if(hlBackColor=="") hlBackColor=PZ_DEF_HL_BACK_COLOR;
	if(hlTextColor=="") hlTextColor=PZ_DEF_HL_TEXT_COLOR;
	PZ_CUR_ROW_COLOR=thisRow.cells[0].style.backgroundColor;
	font=eval(document.getElementById("font_"+id+"0"));
	if(font) PZ_CUR_TEXT_COLOR=font.color;
	CellCount=thisRow.cells.length;
	for(i=0; i<CellCount; i++) {
		thisRow.cells[i].style.backgroundColor=hlBackColor;
		//thisRow.cells[i].style.fontColor=hlTextColor;
		font=eval(document.getElementById("font_"+id+i));
		if(font) font.color=hlTextColor;
	}
}

function setBackRowColor(thisRow) {
	id=thisRow.id;
	CellCount=thisRow.cells.length;
	for(i=0; i<CellCount; i++) {
		thisRow.cells[i].style.backgroundColor=PZ_CUR_ROW_COLOR;
		//thisRow.cells[i].style.fontColor=PZ_CUR_TEXT_COLOR;
		font=eval(document.getElementById("font_"+id+i));
		if(font) font.color=PZ_CUR_TEXT_COLOR;
	}
}
