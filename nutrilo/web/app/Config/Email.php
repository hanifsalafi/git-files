<?php
namespace Config;

use CodeIgniter\Config\BaseConfig;

class Email extends BaseConfig
{

	/**
	 * @var string
	 */
	public $fromEmail = 'edu.hanif@gmail.com';

	/**
	 * @var string
	 */
	public $fromName = 'Hanif Salafi';

	/**
	 * @var string
	 */
	public $recipients = 'hanifsalafi456@gmail.com';

	/**
	 * The "user agent"
	 *
	 * @var string
	 */
	public $userAgent = 'CodeIgniter';

	/**
	 * The mail sending protocol: mail, sendmail, smtp
	 *
	 * @var string
	 */
	public $protocol = 'smtp';

	/**
	 * The server path to Sendmail.
	 *
	 * @var string
	 */
	public $mailPath;

	/**
	 * SMTP Server Address
	 *
	 * @var string
	 */
	public $SMTPHost = 'smtp.gmail.com"';

	/**
	 * SMTP Username
	 *
	 * @var string
	 */
	public $SMTPUser = 'edu.hanif@gmail.com';

	/**
	 * SMTP Password
	 *
	 * @var string
	 */
	public $SMTPPass = 'qwerty661997';

	/**
	 * SMTP Port
	 *
	 * @var integer
	 */
	public $SMTPPort = 587;

	/**
	 * SMTP Timeout (in seconds)
	 *
	 * @var integer
	 */
	public $SMTPTimeout = 10;

	/**
	 * Enable persistent SMTP connections
	 *
	 * @var boolean
	 */
	public $SMTPKeepAlive = false;

	/**
	 * SMTP Encryption. Either tls or ssl
	 *
	 * @var string
	 */
	public $SMTPCrypto = 'tls';

	/**
	 * Enable word-wrap
	 *
	 * @var boolean
	 */
	public $wordWrap = true;

	/**
	 * Character count to wrap at
	 *
	 * @var integer
	 */
	public $wrapChars = 76;

	/**
	 * Type of mail, either 'text' or 'html'
	 *
	 * @var string
	 */
	public $mailType = 'text';

	/**
	 * Character set (utf-8, iso-8859-1, etc.)
	 *
	 * @var string
	 */
	public $charset = 'iso-8859-1';

	/**
	 * Whether to validate the email address
	 *
	 * @var boolean
	 */
	public $validate = false;

	/**
	 * Email Priority. 1 = highest. 5 = lowest. 3 = normal
	 *
	 * @var integer
	 */
	public $priority = 3;

	/**
	 * Newline character. (Use “\r\n” to comply with RFC 822)
	 *
	 * @var string
	 */
	public $CRLF = "\r\n";

	/**
	 * Newline character. (Use “\r\n” to comply with RFC 822)
	 *
	 * @var string
	 */
	public $newline = "\r\n";

	/**
	 * Enable BCC Batch Mode.
	 *
	 * @var boolean
	 */
	public $BCCBatchMode = false;

	/**
	 * Number of emails in each BCC batch
	 *
	 * @var integer
	 */
	public $BCCBatchSize = 200;

	/**
	 * Enable notify message from server
	 *
	 * @var boolean
	 */
	public $DSN = true;

}
