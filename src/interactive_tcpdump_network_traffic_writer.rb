class InteractiveTcpdumpNetworkTrafficWriter
  def initialize(ports, capture_pids)
    @ports = ports
    @capture_pid_arg = capture_pids ? "-P" : ""
  end

  def write_network_traffic_to(tcpdump_output_file_path)
    SystemCommandExecutor.invoke_and_kill_on_enter_key_press("tcpdump -q -n -s0 -i lo0  #{@capture_pid_arg} -w #{tcpdump_output_file_path} 'tcp and (port #{@ports.join(' or port ')})'", 'Recording network traffic. Press ENTER to stop...')
  end
end
