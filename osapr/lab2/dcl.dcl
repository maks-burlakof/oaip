lab: dialog {label = "Edge Surface";

	: spacer{height=1;}
	
	: boxed_column {label ="����� �������"; fixed_height = true;
	: edit_box {label = "���������� �:"; key = "pt_x"; edit_width=10;}
 	: edit_box {label = "���������� Y:"; key = "pt_y"; edit_width=10;}
 	: spacer{height=1;}
 	: button { key = "mouse"; fixed_height = true; fixed_width = true; alignment = left; label = "������� ����� -->  "; }
	
	}
	
	: spacer{height=0.1;}
	
	: boxed_row { label ="��������� �����:"; fixed_height = true;
	
 	: edit_box {label = "M-���������:"; key = "pl_m"; edit_width=10;}
 	: edit_box {label = "N-���������:"; key = "pl_n"; edit_width=10;}
 	
	}
	
	: row {
		: button { key = "file"; fixed_height = true; fixed_width = true; alignment = left; label = "����"; }
		: button { key = "color"; fixed_height = true; fixed_width = true; alignment = right; label = "����"; }
	      }
	
	
	: spacer{height=0.2;}
ok_cancel; 

}