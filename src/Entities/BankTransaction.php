<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * BankTransaction
 *
 * @ORM\Table(name="bank_transaction", indexes={@ORM\Index(name="bank_account_id", columns={"from_bank_account_id"}), @ORM\Index(name="to_bank_account_id", columns={"to_bank_account_id"})})
 * @ORM\Entity
 */
class BankTransaction
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="amount", type="decimal", precision=10, scale=0, nullable=true)
     */
    private $amount;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="balance", type="datetime", nullable=true)
     */
    private $balance;

    /**
     * @var string
     *
     * @ORM\Column(name="method", type="string", length=50, nullable=true)
     */
    private $method;

    /**
     * @var string
     *
     * @ORM\Column(name="status", type="string", length=50, nullable=true)
     */
    private $status;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="insert_time", type="datetime", nullable=true)
     */
    private $insertTime;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="last_update", type="datetime", nullable=true)
     */
    private $lastUpdate;

    /**
     * @var \BankAccount
     *
     * @ORM\ManyToOne(targetEntity="BankAccount")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="to_bank_account_id", referencedColumnName="id")
     * })
     */
    private $toBankAccount;

    /**
     * @var \BankAccount
     *
     * @ORM\ManyToOne(targetEntity="BankAccount")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="from_bank_account_id", referencedColumnName="id")
     * })
     */
    private $fromBankAccount;


    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set amount
     *
     * @param string $amount
     *
     * @return BankTransaction
     */
    public function setAmount($amount)
    {
        $this->amount = $amount;

        return $this;
    }

    /**
     * Get amount
     *
     * @return string
     */
    public function getAmount()
    {
        return $this->amount;
    }

    /**
     * Set balance
     *
     * @param \DateTime $balance
     *
     * @return BankTransaction
     */
    public function setBalance($balance)
    {
        $this->balance = $balance;

        return $this;
    }

    /**
     * Get balance
     *
     * @return \DateTime
     */
    public function getBalance()
    {
        return $this->balance;
    }

    /**
     * Set method
     *
     * @param string $method
     *
     * @return BankTransaction
     */
    public function setMethod($method)
    {
        $this->method = $method;

        return $this;
    }

    /**
     * Get method
     *
     * @return string
     */
    public function getMethod()
    {
        return $this->method;
    }

    /**
     * Set status
     *
     * @param string $status
     *
     * @return BankTransaction
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status
     *
     * @return string
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set insertTime
     *
     * @param \DateTime $insertTime
     *
     * @return BankTransaction
     */
    public function setInsertTime($insertTime)
    {
        $this->insertTime = $insertTime;

        return $this;
    }

    /**
     * Get insertTime
     *
     * @return \DateTime
     */
    public function getInsertTime()
    {
        return $this->insertTime;
    }

    /**
     * Set lastUpdate
     *
     * @param \DateTime $lastUpdate
     *
     * @return BankTransaction
     */
    public function setLastUpdate($lastUpdate)
    {
        $this->lastUpdate = $lastUpdate;

        return $this;
    }

    /**
     * Get lastUpdate
     *
     * @return \DateTime
     */
    public function getLastUpdate()
    {
        return $this->lastUpdate;
    }

    /**
     * Set toBankAccount
     *
     * @param \BankAccount $toBankAccount
     *
     * @return BankTransaction
     */
    public function setToBankAccount(\BankAccount $toBankAccount = null)
    {
        $this->toBankAccount = $toBankAccount;

        return $this;
    }

    /**
     * Get toBankAccount
     *
     * @return \BankAccount
     */
    public function getToBankAccount()
    {
        return $this->toBankAccount;
    }

    /**
     * Set fromBankAccount
     *
     * @param \BankAccount $fromBankAccount
     *
     * @return BankTransaction
     */
    public function setFromBankAccount(\BankAccount $fromBankAccount = null)
    {
        $this->fromBankAccount = $fromBankAccount;

        return $this;
    }

    /**
     * Get fromBankAccount
     *
     * @return \BankAccount
     */
    public function getFromBankAccount()
    {
        return $this->fromBankAccount;
    }
}

