<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class oefening extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'name_nl','description','description_nl','explanation','explanation_nl','GIF'];
}
