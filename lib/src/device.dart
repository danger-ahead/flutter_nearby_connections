part of nearby_connections;

/// [SessionState] It identifies  peer's state and provides 3 states: [SessionState.notConnected], [SessionState.connecting], [SessionState.connected].
enum SessionState {
  /// peer is not invite.
  notConnected,
  /// peer has been invited and waited for connecting
  connecting,
  /// peer has received the invitation and has accepted. Then both peers can communicate with each other.
  connected
}

/// The class [Device] provides a peer information including [Device.deviceID], [Device.displayName], [Device.state]
class Device {
  /// Peer ID
  String deviceID;
  /// Peer name
  String displayName;
  /// Provide peer state
  /// See [SessionState]
  SessionState state = SessionState.notConnected;

  Device(this.deviceID, this.displayName, int state) {
    switch (state) {
      case 1:
        this.state = SessionState.connecting;
        break;
      case 2:
        this.state = SessionState.connected;
        break;
      default:
        this.state = SessionState.notConnected;
        break;
    }
  }

  factory Device.fromJson(json) {
    return Device(json["deviceID"], json["displayName"], json["state"]);
  }
}
