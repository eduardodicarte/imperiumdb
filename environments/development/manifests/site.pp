node default{
  
  class { 'dc_impdb':
    userdb => $::db_user,
    passdb => $::db_pass,
    namedb => $::db_name,
    namesch => $::sch_name,
    nametbl => $::tbl_name 
  }
}