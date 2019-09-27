screenconnectPath="/opt/screenconnect"

unset IFS
export PATH="$screenconnectPath/App_Runtime/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export MONO_PATH="$screenconnectPath/App_Runtime/lib"
export MONO_CFG_DIR="$screenconnectPath/App_Runtime/etc"
export XDG_CONFIG_HOME="$screenconnectPath/App_Runtime/etc"
export MONO_XMLSERIALIZER_THS=no


/etc/init.d/screenconnect restart