// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/jballerina.java;

# Represents a channel, which could be used to read characters through a given ReadableByteChannel.
public class ReadableCharacterChannel {

    private ReadableByteChannel byteChannel;
    private string charset;

    # Constructs a `ReadableCharacterChannel` from a given `ReadableByteChannel` and `Charset`.
    # 
    # + byteChannel - The `ReadableByteChannel`, which would be used to read the characters
    # + charset - The character set, which would be used to encode/decode the given bytes to characters
    public isolated function init(ReadableByteChannel byteChannel, string charset) {
        self.byteChannel = byteChannel;
        self.charset = charset;
        initReadableCharacterChannel(self, byteChannel, charset);
    }

    # Reads a given number of characters. This will attempt to read up to the `numberOfChars` characters of the channel.
    # An `io:EofError` will return once the channel reaches the end.
    # ```ballerina
    # string|io:Error result = readableCharChannel.read(1000);
    # ```
    #
    # + numberOfChars - Number of characters, which should be read
    # + return - Content, which is read, an `EofError` once the channel reaches the end or else an `io:Error`
    public isolated function read(@untainted int numberOfChars) returns @tainted string|Error {
        return readExtern(self, numberOfChars);
    }

    # Read the entire channel content as a string.
    # ```ballerina
    # string|io:Error content = readableCharChannel.readString();
    # ```
    # + return - Either a string or `io:Error`
    public isolated function readString() returns @tainted string|Error {
        return readAllAsStringExtern(self);
    }

    # Read the entire channel content as a list of lines.
    # ```ballerina
    # string[]|io:Error content = readableCharChannel.readAllLines();
    # ```
    # + return - Either a string array or `io:Error`
    public isolated function readAllLines() returns @tainted string[]|Error {
        return readAllLinesExtern(self);
    }

    # Reads a JSON from the given channel.
    # ```ballerina
    # json|io:Error result = readableCharChannel.readJson();
    # ```
    #
    # + return - The read JSON string or else an `io:Error`
    public isolated function readJson() returns @tainted json|Error {
        return readJsonExtern(self);
    }

    # Reads an XML from the given channel.
    # ```ballerina
    # json|io:Error result = readableCharChannel.readXml();
    # ```
    #
    # + return - The read XML or else an `io:Error`
    public isolated function readXml() returns @tainted xml|Error {
        return readXmlExtern(self);
    }

    # Reads a property from a .properties file with a default value.
    # ```ballerina
    # string|io:Error result = readableCharChannel.readProperty(key, defaultValue);
    # ```
    # + key - The property key needs to read.
    # + defaultValue - Default value to be return.
    # + return - The read property value or else an `io:Error`
    public isolated function readProperty(string key, string defaultValue = "") returns @tainted string|Error {
        return readPropertyExtern(self, key, defaultValue);
    }

    # Return a stream of lines that can be used to read all the lines in a file as a stream.
    # ```ballerina
    # stream<string, io:Error>|io:Error? result = readableCharChannel.lineStream();
    # ```
    #
    # + return - Either a stream of strings(lines) or an io:Error.
    public isolated function lineStream() returns stream<string, Error>|Error {
        LineStream lineStream = new (self);
        return new stream<string, Error>(lineStream);
    }

    # Reads all properties from a .properties file.
    # ```ballerina
    # map<string>|io:Error result = readableCharChannel.readAllProperties();
    # ```
    #
    # + return - A map that contains all properties
    public isolated function readAllProperties() returns @tainted map<string>|Error {
        return readAllPropertiesExtern(self);
    }

    # Closes a given character channel.
    # After a channel is closed, any further reading operations will cause an error.
    # ```ballerina
    # io:Error? err = readableCharChannel.close();
    # ```
    #
    # + return - If an error occurred while writing
    public isolated function close() returns Error? {
        return closeReadableCharacterChannel(self);
    }
}

isolated function initReadableCharacterChannel(ReadableCharacterChannel characterChannel, ReadableByteChannel byteChannel,
                                      string charset) = @java:Method {
    name: "initCharacterChannel",
    'class: "org.ballerinalang.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;

isolated function readExtern(ReadableCharacterChannel characterChannel, @untainted int numberOfChars) returns @tainted string|
Error = @java:Method {
    name: "read",
    'class: "org.ballerinalang.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;

isolated function readAllLinesExtern(ReadableCharacterChannel characterChannel) returns @tainted string[]|Error = @java:Method {
    name: "readAllLines",
    'class: "org.ballerinalang.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;

isolated function readAllAsStringExtern(ReadableCharacterChannel characterChannel) returns @tainted string|Error = @java:Method {
    name: "readString",
    'class: "org.ballerinalang.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;

isolated function readJsonExtern(ReadableCharacterChannel characterChannel) returns @tainted json|Error = @java:Method {
    name: "readJson",
    'class: "org.ballerinalang.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;

isolated function readXmlExtern(ReadableCharacterChannel characterChannel) returns @tainted xml|Error = @java:Method {
    name: "readXml",
    'class: "org.ballerinalang.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;

isolated function readPropertyExtern(ReadableCharacterChannel characterChannel, string key, string defaultValue) returns @tainted string|
Error = @java:Method {
    name: "readProperty",
    'class: "org.ballerinalang.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;

isolated function readAllPropertiesExtern(ReadableCharacterChannel characterChannel) returns @tainted map<string>|Error = @java:Method {
    name: "readAllProperties",
    'class: "org.ballerinalang.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;

isolated function closeReadableCharacterChannel(ReadableCharacterChannel characterChannel) returns Error? = @java:Method {
    name: "close",
    'class: "org.ballerinalang.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;
