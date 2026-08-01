# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# --- Proxy Control Functions ---
proxy_on() {
    if [ -f ~/.env_proxy ]; then
        source ~/.env_proxy
        echo -e "\e[32m[Proxy] Enabled\e[0m"
        echo "HTTP_PROXY: $http_proxy"
        echo "HTTPS_PROXY : $https_proxy"
        echo "NO_PROXY    : $no_proxy"
    else
        echo -e "\e[31m[Error] ~/.env_proxy not found\e[0m"
    fi
}

proxy_off() {
    unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY no_proxy NO_PROXY
    echo -e "\e[33m[Proxy] Disabled\e[0m"
}

proxy_status() {
    echo -e "\e[34m[Environment Variables]\e[0m"
    if [ -z "$http_proxy" ]; then
        echo "Proxy: DISABLED (Variable is empty)"
    else
        echo "HTTP_PROXY  : $http_proxy"
        echo "HTTPS_PROXY : $https_proxy"
        echo "NO_PROXY    : $no_proxy"
    fi

    echo -e "\n\e[34m[Host Info]\e[0m"
    echo "Windows Host IP: ${WSL_HOST_IP}"

    echo -e "\n\e[34m[Connectivity Test]\e[0m"
    local baidu_code=$(curl -I -s -o /dev/null -w "%{http_code}" http://www.baidu.com --connect-timeout 2)
    local google_code=$(curl -I -s -o /dev/null -w "%{http_code}" https://www.google.com --connect-timeout 2)
    echo -n "Baidu (Direct/Proxy)  : "
    if [ "$baidu_code" = "200" ]; then echo -e "\e[32mPASS ($baidu_code)\e[0m"; else echo -e "\e[31mFAIL ($baidu_code)\e[0m"; fi
    echo -n "Google (Proxy Required): "
    if [ "$google_code" = "200" ]; then echo -e "\e[32mPASS ($google_code)\e[0m"; else echo -e "\e[31mFAIL ($google_code)\e[0m"; fi
}
