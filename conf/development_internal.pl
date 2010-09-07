+{
    default => {
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
