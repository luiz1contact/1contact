<%

    #
    #  Copyright (C) 2001, 2002 MIT
    #
    #  This file is part of dotLRN.
    #
    #  dotLRN is free software; you can redistribute it and/or modify it under the
    #  terms of the GNU General Public License as published by the Free Software
    #  Foundation; either version 2 of the License, or (at your option) any later
    #  version.
    #
    #  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
    #  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    #  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
    #  details.
    #

%>

<div class="banners_images_portlet">
	<div id="banner_carousel">
      		<div class="previous_button"></div>  
      			<div class="container">
					<ul>
						<multiple name="banners">
							<li>
										<a href="@banners.url@" title="@banners.name@" target="_blank"><img src="@banners.publish_image@" alt="@banners.name@" /></a>
							</li>
						</multiple>
					</ul>
				</div>
      		<div class="next_button"></div>
	</div>
</div>

<script type="text/javascript">
new UI.Carousel("banner_carousel");
</script>
