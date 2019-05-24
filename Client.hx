import tink.http.clients.*;
import tink.web.proxy.Remote;
import tink.url.Host;
import Server.Root;

import ApiResult.Result;


typedef Some = {
  a: Int,
  b: String
}

@:expose
class Client {
    public static function main() {
        var remote = new Remote<Root>(new JsClient(), new RemoteEndpoint(new Host('localhost', 3000)));
        // Completion works for the var below. If you try
        // bar. <-- it will correctly show the popup with `a` and `b`
        var bar: Some = {a: 1, b: 'Foo'};
        trace(bar.a);
        
        // Completion *does not work* for the remote object though:
        // remote. <-- nothing happens

        remote.hello().handle((o) -> {
          trace(o);
        });
    }
}
