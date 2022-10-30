/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
"use strict";

Components.utils.import("resource://gre/modules/XPCOMUtils.jsm");
Components.utils.import("resource://gre/modules/Services.jsm");
Components.utils.import("resource://gre/modules/NetUtil.jsm");

function mozProtocolHandler() {}
mozProtocolHandler.prototype = {
  scheme: "moz",
  defaultPort: -1,
  protocolFlags: Components.interfaces.nsIProtocolHandler.URI_DANGEROUS_TO_LOAD,

  newURI(spec, charset, base) {
    let uri = Components.classes["@mozilla.org/network/simple-uri;1"].createInstance(Components.interfaces.nsIURI);
    if (base) {
      uri.spec = base.resolve(spec);
    } else {
      uri.spec = spec;
    }
    return uri;
  },

  newChannel2(uri, loadInfo) {
    let realURL = NetUtil.newURI("about:mozilla");
    let channel = Services.io.newChannelFromURIWithLoadInfo(realURL, loadInfo)
    channel.loadFlags |= Components.interfaces.nsIChannel.LOAD_REPLACE;
    return channel;
  },

  newChannel(uri) {
    return this.newChannel(uri, null);
  },

  classID: Components.ID("{47a45e5f-691e-4799-8686-14f8d3fc0f8c}"),

  QueryInterface: XPCOMUtils.generateQI([Components.interfaces.nsIProtocolHandler]),
};

this.NSGetFactory = XPCOMUtils.generateNSGetFactory([mozProtocolHandler]);
