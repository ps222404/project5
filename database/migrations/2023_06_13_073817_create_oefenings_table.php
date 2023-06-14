<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('oefeningen', function (Blueprint $table) {
            $table->id();
            $table->string("name");
            $table->string("name_nl");
            $table->string("description");
            $table->string("description_nl");
            $table->string('explanation', 1000);
            $table->string('explanation_nl', 1000);
            $table->string("GIF");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('oefeningen');
    }
};
