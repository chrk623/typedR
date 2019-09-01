function script_name_mac(script_name) {
    if(script_name === "") {
        return "";
    }
    return `- ${script_name}.R`;
}
