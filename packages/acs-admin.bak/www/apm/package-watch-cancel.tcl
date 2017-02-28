ad_page_contract {
    Cancels all watches in given package.

    @author Peter Marklund
    @cvs-id $Id: package-watch-cancel.tcl,v 1.1.24.1 2015/09/10 08:21:02 gustafn Exp $
} {
    package_key
    {return_url "index"}
} 

apm_cancel_all_watches $package_key

ad_returnredirect $return_url

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End: