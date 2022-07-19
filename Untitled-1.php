<!-- formulier die naar wordt gebruikt om de gegevens in de db op teslaan door insert.php:70 -->
              <h1>Voeg player toe</h1>
                           
          <form action='insert.php' method='post' class='form_1'>
                  
          <input type='text' name='host'    class='form-control'      placeholder='Hostname'                    required>
          <input type='text' name='ether'    class='form-control'      placeholder='Ether/Mac-adres'            required>
          <input type='text' name='ip'      class='form-control'      placeholder='Ip adres'    minlength='1'   required>
          <input type='text' name='gateway' class='form-control'      placeholder='Gateway'     minlength='1'   required> 
          <input type='text' name='netmask' class='form-control'      placeholder='Netmask'     minlength='1'   required> 
          <input type='text' name='dns'     class='form-control'      placeholder='DNS Server'  minlength='1'   required>
          <BR> <BR>
          <label></label  placeholder='DHCP OF STATIC'>
          <select name='netwerk'> 
          <option type='text' name='netwerk' value='DHCP'>DHCP</option>
          <option type='text' name='netwerk' value='Static'>Static</option><a>   
          </a> <input type='submit' class='btn' name='submit' value='Submit'></form>
          </select>
              <BR>  <BR>

</th></table>
</body>
</html> 