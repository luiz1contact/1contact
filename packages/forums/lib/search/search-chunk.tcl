ad_page_contract {

    @author yon@openforce.net
    @creation-date 2002-07-01
    @cvs-id $Id: search-chunk.tcl,v 1.9 2015/06/29 11:08:28 gustafn Exp $

}
set package_id [ad_conn package_id]
set useScreenNameP [parameter::get -parameter "UseScreenNameP" -default 0]

set searchbox_p [parameter::get -parameter ForumsSearchBoxP -package_id $package_id -default 1]
if {$searchbox_p} {
    form create search -has_submit 1
    forums::form::search search

    if {[form is_valid search]} {
        form get_values search search_text forum_id

        # remove any special characters from the search text so we
        # don't crash interMedia
        regsub -all {[^[:alnum:]_[:blank:]]} $search_text {} search_text

        set query search_all_forums
        if {$forum_id ne ""} {
            set query search_one_forum
	    if {![string is integer -strict $forum_id]} {
		ns_log warning "forum_id <$forum_id> is not an integer: probably a security check or an attempted injection"
		set name forum_id
		ad_complain [_ acs-tcl.lt_name_is_not_an_intege]
		set messages:rowcount 0
		return
	    }
        }
        
        if { [parameter::get -parameter UseIntermediaForSearchP -default 0] } {
            append query "_intermedia"
        }
    
        db_multirow -extend { author posting_date_pretty} messages $query {} {
            set posting_date_pretty [lc_time_fmt $posting_date_ansi "%x %X"]
            if { $useScreenNameP } {
                set author [db_string select_screen_name {select screen_name from users where user_id = :user_id}]
            } else {
                set author $user_name
            }
        }
    } else {
        set messages:rowcount 0
    }

    if {([info exists alt_template] && $alt_template ne "")} {
        ad_return_template $alt_template
    }
}
