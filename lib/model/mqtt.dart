// import 'dart:convert';
// import 'dart:io';
// import 'package:mqtt_client/mqtt_browser_client.dart';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';


class MqttService {
  // final clientWeb = MqttBrowserClient('ws://test.mosquitto.org', 'niagara');
  // final clientMob = MqttBrowserClient('ws://test.mosquitto.org', 'niagara');

  // void initializeMqttClient()async{
  //   clientMob.port = 8080;
  //   clientMob.keepAlivePeriod = 20;
  //   clientMob.onDisconnected = onDisconnected;
  //   clientMob.logging(on: false);
  //   clientMob.onSubscribed = onSubscribed;
  //   clientMob.onConnected = onConnected;
  //   try {
  //     await clientMob.connect();
  //   } on Exception catch (e) {
  //     print('EXAMPLE::client exception - $e');
  //     clientMob.disconnect();
  //   }
  // }

  // void onPRessMQTTTest() async {
  //   // client.logging(on: false);
  //
  //   /// Set the correct MQTT protocol for mosquito
  //   clientWeb.setProtocolV311();
  //   /// If you intend to use a keep alive you must set it here otherwise keep alive will be disabled.
  //   clientWeb.keepAlivePeriod = 20;
  //
  //   /// The connection timeout period can be set if needed, the default is 5 seconds.
  //   clientWeb.connectTimeoutPeriod = 2000; // milliseconds
  //
  //   /// The ws port for Mosquitto is 8080, for wss it is 8081
  //   clientWeb.port = 8080;
  //   /// Add the unsolicited disconnection callback
  //   clientWeb.onDisconnected = onDisconnected;
  //
  //   /// Add the successful connection callback
  //   clientWeb.onConnected = onConnected;
  //
  //   /// Add a subscribed callback, there is also an unsubscribed callback if you need it.
  //   /// You can add these before connection or change them dynamically after connection if
  //   /// you wish. There is also an onSubscribeFail callback for failed subscriptions, these
  //   /// can fail either because you have tried to subscribe to an invalid topic or the broker
  //   /// rejects the subscribe request.
  //   clientWeb.onSubscribed = onSubscribed;
  //   /// Set a ping received callback if needed, called whenever a ping response(pong) is received
  //   /// from the broker.
  //   clientWeb.pongCallback = pong;
  //
  //
  //   /// Set the appropriate websocket headers for your connection/broker.
  //   /// Mosquito uses the single default header, other brokers may be fine with the
  //   /// default headers.
  //   clientWeb.websocketProtocols = MqttClientConstants.protocolsSingleDefault;
  //
  //   /// Create a connection message to use or use the default one. The default one sets the
  //   /// client identifier, any supplied username/password and clean session,
  //   /// an example of a specific one below.
  //   final connMess = MqttConnectMessage()
  //       .withClientIdentifier('')
  //       .withWillTopic('willtopic') // If you set this you must set a will message
  //       .withWillMessage('My Will message')
  //       .startClean() // Non persistent session for testing
  //       .withWillQos(MqttQos.atLeastOnce);
  //   print('EXAMPLE::Mosquitto client connecting....');
  //   clientWeb.connectionMessage = connMess;
  //
  //   /// Connect the client, any errors here are communicated by raising of the appropriate exception. Note
  //   /// in some circumstances the broker will just disconnect us, see the spec about this, we however will
  //   /// never send malformed messages.
  //   try {
  //     await clientWeb.connect();
  //   } on Exception catch (e) {
  //     print('EXAMPLE::client exception - $e');
  //     clientWeb.disconnect();
  //   }
  //
  //   /// Check we are connected
  //   if (clientWeb.connectionStatus!.state == MqttConnectionState.connected) {
  //     print('EXAMPLE::Mosquitto client connected');
  //   } else {
  //     /// Use status here rather than state if you also want the broker return code.
  //     print(
  //         'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${clientWeb.connectionStatus}');
  //     clientWeb.disconnect();
  //   }
  //
  //   /// Ok, lets try a subscription
  //   // print('EXAMPLE::Subscribing to the test/lol topic');
  //   // const topic = 'test/lol'; // Not a wildcard topic
  //   // client.subscribe(topic, MqttQos.atMostOnce);
  //   //
  //   /// The client has a change notifier object(see the Observable class) which we then listen to to get
  //   /// notifications of published updates to each subscribed topic.
  //   clientWeb.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
  //     final recMess = c![0].payload as MqttPublishMessage;
  //     final pt =
  //     MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //
  //     /// The above may seem a little convoluted for users only interested in the
  //     /// payload, some users however may be interested in the received publish message,
  //     /// lets not constrain ourselves yet until the package has been in the wild
  //     /// for a while.
  //     /// The payload is a byte buffer, this will be specific to the topic
  //     // print(
  //     //     'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
  //     // print('');
  //   });
  //
  //   /// If needed you can listen for published messages that have completed the publishing
  //   /// handshake which is Qos dependant. Any message received on this stream has completed its
  //   /// publishing handshake with the broker.
  //   clientWeb.published!.listen((MqttPublishMessage message) {
  //     print(
  //         'EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
  //   });
  //
  //   /// Lets publish to our topic
  //   /// Use the payload builder rather than a raw buffer
  //   /// Our known topic to publish to
  //   const pubTopic = 'Dart/Mqtt_client/testtopic';
  //   final builder = MqttClientPayloadBuilder();
  //   builder.addString('Hello from mqtt_client');
  //
  //   /// Subscribe to it
  //   // print('EXAMPLE::Subscribing to the Dart/Mqtt_client/testtopic topic');
  //   clientWeb.subscribe(pubTopic, MqttQos.exactlyOnce);
  //
  //   /// Publish it
  //   // print('EXAMPLE::Publishing our topic');
  //   clientWeb.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);
  //
  //   /// Ok, we will now sleep a while, in this gap you will see ping request/response
  //   /// messages being exchanged by the keep alive mechanism.
  //   // print('EXAMPLE::Sleeping....');
  //   await MqttUtilities.asyncSleep(60);
  //
  //   /// Finally, unsubscribe and exit gracefully
  //   // print('EXAMPLE::Unsubscribing');
  //   // client.unsubscribe(topic);
  //
  //   /// Wait for the unsubscribe message from the broker if you wish.
  //   await MqttUtilities.asyncSleep(2);
  //   // print('EXAMPLE::Disconnecting');
  //   clientWeb.disconnect();
  //
  // }

  void onSubscribed(String topic) {
    // print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    // print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    // if (clientWeb.connectionStatus!.disconnectionOrigin ==
    //     MqttDisconnectionOrigin.solicited) {
    //   // print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    // }
  }

  /// The successful connect callback
  void onConnected() {
    print('connected');
    // print(
    //     'EXAMPLE::OnConnected client callback - Client connection was sucessful');
  }

  /// Pong callback
  void pong() {
    print('EXAMPLE::Ping response client callback invoked');
  }


}

