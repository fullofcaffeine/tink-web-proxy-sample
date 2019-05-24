import tink.http.clients.*;
import tink.web.proxy.Remote;
import tink.url.Host;
import Server.Root;

import ApiResult.Result;

@:expose
class Client {
    public static function main() {
        var remote = new Remote<Root>(new JsClient(), new RemoteEndpoint(new Host('localhost', 3000)));
        var ret = remote.hello().handle((o) -> {
          trace(o);
        });
    }
}
