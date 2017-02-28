# /packages/mbryzek-subsite/www/admin/rel-type/new.tcl

ad_page_contract {

    Form to select a supertype for a new relationship type

    @author mbryzek@arsdigita.com
    @creation-date Sun Nov 12 18:27:08 2000
    @cvs-id $Id: new.tcl,v 1.5.2.2 2015/10/28 09:38:37 gustafn Exp $

} {
    { return_url "" }
} -properties {
    context:onevalue
}


db_multirow supertypes select_supertypes {}

set context [list [list "[ad_conn package_url]admin/rel-types/" [_ acs-subsite.Relationship_Types]] [_ acs-subsite.Create_relation_type]]

set export_vars [export_vars -form {return_url}]

ad_return_template

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End: