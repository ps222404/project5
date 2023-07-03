<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class prestatie extends Model
{
    use HasFactory;
    protected $fillable = ['oefening_id','amount', 'date','time','user_id'];
}
