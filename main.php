<?php

/**
 * @link
 * - https://docs.amazonaws.cn/en_us/AmazonCloudFront/latest/DeveloperGuide/CreateURL_PHP.html
 * - https://docs.amazonaws.cn/zh_cn/aws-sdk-php/guide/latest/service/cloudfront-signed-url.html
 */

require __DIR__ . '/vendor/autoload.php';

$client = new Aws\CloudFront\CloudFrontClient([
    'region' => 'ap-northeast-1',
    'version' => '2014-11-06',
]);

$domain = $_ENV['CLOUDFRONT_DOMAIN'];
$keyPairId = $_ENV['CLOUDFRONT_KEY_PAIR_ID'];

$resourceKey = "https://${domain}/hoge.txt";
$expires = time() + 60;

$signedUrlCannedPolicy = $client->getSignedUrl([
    'url' => $resourceKey,
    'expires' => $expires,
    'private_key' => __DIR__ . '/dist/private_key.pem',
    'key_pair_id' => $keyPairId,
]);

echo $signedUrlCannedPolicy . PHP_EOL;
