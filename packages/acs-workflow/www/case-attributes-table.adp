<table cellspacing="0" cellpadding="0" border="0">
  <tr>
    <td bgcolor="#cccccc">
      <table width="100%" cellspacing="1" cellpadding="4" border="0">
        <tr valign="middle" bgcolor="#ffffe4">
          <th>Attribute</th>
          <th>Current Value</th>
<!--          <th>Action</th> -->
        </tr>
        <multiple name="attributes">
          <tr bgcolor="#eeeeee">
            <td>@attributes.pretty_name@</td>
            <td>@attributes.value_pretty@</td>
<!-- 
            <td align="center">
              <if @attributes.edit_url@ not nil>
                (<a href="@attributes.edit_url@">edit</a>)
              </if>
            </td>
-->
          </tr>
        </multiple>
      </table>
    </td>
  </tr>
</table>


