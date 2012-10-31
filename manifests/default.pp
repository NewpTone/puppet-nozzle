class nozzle::default(
        $api_listen             = '0.0.0.0',
        $server_listen          = '0.0.0.0',
        $broadcast_listen       = '127.0.0.1',
        $feedback_listen        = '127.0.0.1',
        $sql_connection         = '',
        $nova_admin_username ,
        $nova_admin_password ,
        $nova_admin_tenant_name = 'services',
        $nova_admin_auth_url    = 'http://localhost:5000/v2.0',
        $rabbit_userid          = 'guest',
        $rabbit_password        = 'nova',
) {

    nozzle_config {
        'DEFAULT/api_listen':               value => $api_listen,
        'DEFAULT/server_listen':            value => $server_listen,
        'DEFAULT/broadcast_listen':         value => $broadcast_listen,
        'DEFAULT/feedback_listen':          value => $feedback_listen,
        'DEFAULT/sql_connection':           value => $sql_connection,
        'DEFAULT/nova_admin_username':      value => $nova_admin_username,
        'DEFAULT/nova_admin_password':      value => $nova_admin_password,
        'DEFAULT/nova_admin_tenant_name':   value => $nova_admin_tenant_name,
        'DEFAULT/nova_admin_auth_url':      value => $nova_admin_auth_url,
        'DEFAULT/rabbit_userid':            value => $rabbit_userid,
        'DEFAULT/rabbit_password':          value => $rabbit_password,
}
