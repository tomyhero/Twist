+{
    default => {
        'middlewares' => [
        {
            'module' => 'Plack::Middleware::StackTrace',
        },
        {
            'module' => 'Plack::Middleware::Static',
            'opts' => {
                'root' => 'view/',
                'path' => '^/static/'
            },
        }
        ],
        'plugins' => [
            'Polocky::WAF::CatalystLike::Plugin::ShowDispatcher',
        ],
        'logger' => {
            'dispatchers' => [
                'screen'
                ],
                'screen' => {
                    'stderr' => '1',
                    'class' => 'Log::Dispatch::Screen',
                    'min_level' => 'debug'
                }
        },
    }
}
