# /packages/1c-mandat/tcl/1c-mandat-api-procs.tcl
ad_library {
    Library to support the 1Contact procs

     @author Iuri Sampaio [iuri@iurix.com]
     @creation-date Mon Sep 12 17:35:01 2016
     @cvs-id $Id: ix-ndc-procs.tcl,v 0.1d 
}


namespace eval 1c_mandat {}

namespace eval 1c_mandat::mandat {}



ad_proc -public 1c_mandat::mandat::delete {
    item_id
} {
    Delete a mandat
} {

    db_transaction {
	db_exec_plsql 1c_mandat__delete {
	    SELECT 1c_mandat__delete ( :mandat_id )
	}
    }
    
    return 
}

ad_proc -public 1c_mandat::mandat::edit {
    {-mandat_id:required}
    {-type_of_transaction ““}
    {-type_of_property ““}
    {-file_p ““}
    {-remarks1 ““} 
    {-remarks2 ““}
    {-payment_p ““}
    {-status ““}
    {-link ““}
    {-terms_conditions_p ““}
    {-creation_user ““}
    {-creation_ip ““}
    {-context_id ““}
} {
    Edit mandat info
} {

}



ad_proc 1c_mandat::mandat::publish {
    IT publoishes a mandat
} {
    {-item_id:required}
    {-revision_id:optional}
} {
	
    	item::publish -item_id $item_id -revision_id $revision_id
    }


ad_proc 1c_mandat::mandat::add {
    {-item_id ""}
    {-type_of_transaction ""}
    {-type_of_property ""}
    {-type_of_residence ""}
    {-type_of_commerce ""}
    {-code ""}
    {-room_qty ""}
    {-surface_min ""}
    {-budget_min ""}
    {-budget_max ""}
    {-file_p ""}
    {-remarks1 ""} 
    {-remarks2 ""}
    {-confirmation ""}
    {-origin ""}
    {-origin_other ""}
    {-payment_p ""}
    {-status ""}
    {-terms_conditions_p:required}
    {-creation_user ""}
    {-creation_ip ""}
    {-context_id ""}
} {
    ad_proc to add a new mandat 

    @author Iuri Sampaio
} {



#    set link [util_text_to_url -replacement "" -text $link]
   

    if {$creation_ip == ""} {
	set creation_ip [ad_conn peeraddr]
    }
    
    if {$creation_user == ""} {
	set creation_user [ad_conn user_id]
    }
     
    if {$context_id == ""} {
	set context_id [ad_conn package_id]
    }

    if {![exists_and_not_null item_id]} {
	set item_id [db_nextval "acs_object_id_seq"]
	content::item::new \
	    -item_id $item_id \
	    -name "mandat-$item_id" \
	    -parent_id $context_id \
	    -content_type "mandat_object" \
	    -package_id $context_id \
	    -creation_user $creation_user \
	    -creation_ip $creation_ip 
    }
    
    db_transaction {
	db_exec_plsql insert_mandat {
	    SELECT mandat__new(
			       :item_id,
			       :type_of_transaction,
			       :type_of_property,
			       :type_of_residence,
			       :type_of_commerce,
			       :code,
			       :room_qty,
			       :surface_min,
			       :budget_min,
			       :budget_max,
			       :file_p,
			       :remarks1,
			       :remarks2,
			       :confirmation,
			       :origin,
			       :origin_other,
			       :payment_p,
			       :status,
			       :terms_conditions_p);
	}
    }
    
    
    return $item_id
}

