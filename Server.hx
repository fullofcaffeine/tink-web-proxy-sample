package;

import tink.http.containers.NodeContainer;
import tink.web.routing.Router;
import tink.web.routing.Context;
import tink.http.Response;

import ApiResult.Result;

class Root {
    public function new() {}

    @:get('/hello')
    public function hello():Result
        return  {
            slideshow: {
                title: 'Look!',
                author: 'Mr. Bean',
                date: '2018-08-08',
                slides: [
                    {
                        title: 'Woohoo',
                        type: 'silly',
                        items: ['item_foo', 'item_bar']
                    }
                ]
            }

        }
}

class Server {
  public static function main() {
    var container = new NodeContainer(3000);
    var router = new Router<Root>(new Root());

    container.run((req) -> router.route(Context.ofRequest(req)).recover(OutgoingResponse.reportError));
  }
}
