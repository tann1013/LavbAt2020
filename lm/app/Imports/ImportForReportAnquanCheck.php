<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;

class ImportForReportAnquanCheck implements ToCollection
{

    protected $userArr;


    public function __construct($userArr=[])
    {
        $this->userArr = $userArr;
    }

    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        dd(222);

        $this->_do($collection);
    }

    /**
     * @param $collection
     */
    private function _do($collection){
        try{

            dd($collection);

            $i=2;
            unset($collection[0]);
            unset($collection[1]);
            foreach ($collection as $item)
            {
                if($item[0]!=null&&$item[1]!=''){
                    // 处理数据
                    $item = $item->toArray();
                }

            }
        }catch(\Exception $e){
            dd($e->getMessage());

            //throw new \Exception('第'.$i.'条格式有问题，数据全部退回，请重新导入');
        }
    }

}
