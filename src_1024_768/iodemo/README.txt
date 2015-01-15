Project Sample IOexample
Version 1.0

The purpose of this sample is to show how to communicate between a serial port and the QML code that implements the GUI.

In the QML -> serial path, the Reach supplied QML viewer provides a connection object with method sendMessage(). This allows QML or Javascript to send text messages. These get translated through the translate.txt file by the Reach supplied tio-agent.

In the serial -> QML path, the serial message is translated via the translate.txt file into a QML "objectName.property=value" operation by the QML viewer. When the value is set, the QML code will use it to update screen values.

In this sample, there are two buttons. Button #1 is activate on click (push and release) and Button #2 is active on release.

To run the sample, use the G2Link program to connect to the display module and then click Publish and Run and pint to the IOexample directory. Attach the serial-USB adapter provided with the dev kit to the DB9 connector on the kit I/O board. Run a teminal emulator such as Realterm at 115200 baud to that port. Push the buttom and see the serial message. type in "tf=70<return>" and see the value change on screen.

 